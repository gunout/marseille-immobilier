#!/usr/bin/env bash
# ============================================================
# download_data.sh — Télécharge les parcelles cadastrales
# pour les 16 arrondissements de Marseille.
# Format de sortie : data/cadastre-<code>-parcelles.json.gz
# ============================================================

set -euo pipefail

DATA_DIR="data"
BASE_URL="https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/communes"

MARSEILLE_CODES=(
  13201 13202 13203 13204 13205 13206 13207 13208
  13209 13210 13211 13212 13213 13214 13215 13216
)

mkdir -p "$DATA_DIR"

command -v curl >/dev/null 2>&1 || { echo "❌ curl requis"; exit 1; }
command -v gunzip >/dev/null 2>&1 || { echo "❌ gunzip requis"; exit 1; }

download_arrondissement() {
  local code="$1"
  local dept="${code:0:2}"
  local url="${BASE_URL}/${dept}/${code}/cadastre-${code}-parcelles.json.gz"
  local out_gz="${DATA_DIR}/cadastre-${code}-parcelles.json.gz"

  if [[ -f "$out_gz" ]] && gunzip -t "$out_gz" 2>/dev/null; then
    echo "⏭️  Déjà présent : $out_gz"
    return 0
  fi

  echo "📥 Téléchargement : $code"
  echo "   → $url"

  if curl -fsSL --retry 3 --retry-delay 2 -o "$out_gz" "$url"; then
    if gunzip -t "$out_gz" 2>/dev/null; then
      echo "   ✅ OK ($(du -h "$out_gz" | cut -f1))"
    else
      echo "   ⚠️  Fichier gzip invalide, suppression"
      rm -f "$out_gz"
      return 1
    fi
  else
    echo "   ❌ Échec du téléchargement pour $code"
    rm -f "$out_gz"
    return 1
  fi
}

echo "============================================"
echo " Marseille — 16 arrondissements"
echo " Dossier : $DATA_DIR"
echo "============================================"

SUCCESS=0
FAIL=0
for code in "${MARSEILLE_CODES[@]}"; do
  if download_arrondissement "$code"; then
    SUCCESS=$((SUCCESS + 1))
  else
    FAIL=$((FAIL + 1))
  fi
done

echo "============================================"
echo " ✅ Succès : $SUCCESS"
echo " ❌ Échecs : $FAIL"
echo "============================================"
echo ""
echo "📂 Contenu de $DATA_DIR :"
ls -lh "$DATA_DIR" || true