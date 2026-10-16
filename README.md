
<div align="center">

# 🏛️ Dashboard Immobilier Marseille 2025

Dashboard interactif des prix immobiliers et des parcelles cadastrales des **16 arrondissements de Marseille**, basé sur les données ouvertes **DVF** (DGFiP) et **Cadastre Etalab**.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/gunout/marseille-immobilier/pulls)
[![Last Commit](https://img.shields.io/github/last-commit/gunout/marseille-immobilier?color=2a6f97)](https://github.com/gunout/marseille-immobilier/commits/main)
[![Issues](https://img.shields.io/github/issues/gunout/marseille-immobilier)](https://github.com/gunout/marseille-immobilier/issues)
[![Stars](https://img.shields.io/github/stars/gunout/marseille-immobilier?style=social)](https://github.com/gunout/marseille-immobilier/stargazers)
[![Forks](https://img.shields.io/github/forks/gunout/marseille-immobilier?style=social)](https://github.com/gunout/marseille-immobilier/network/members)

**Stack :** [![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)](#) [![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)](#) [![Leaflet](https://img.shields.io/badge/Leaflet-199900?logo=leaflet&logoColor=white)](https://leafletjs.com/) [![Chart.js](https://img.shields.io/badge/Chart.js-FF6384?logo=chart.js&logoColor=white)](https://www.chartjs.org/) [![Git LFS](https://img.shields.io/badge/Git%20LFS-enabled-blue?logo=git-lfs&logoColor=white)](https://git-lfs.com/)
</div>

---

## 📖 À propos

Ce projet est un **dashboard web autonome (zéro backend)** qui permet d'explorer :

- 🏘️ Les **parcelles cadastrales** des 16 arrondissements de Marseille
- 💰 Les **transactions immobilières** simulées depuis les statistiques DVF
- 📊 Les **prix au m²** par arrondissement (comparaison et distribution)
- 📈 Des **KPIs temps réel** : prix moyen, médian, volume, surface

---

## ✨ Fonctionnalités

- 🗺️ **Carte interactive Leaflet** centrée sur Marseille
- 🏘️ **16 arrondissements** (13001 → 13016) sélectionnables
- 📍 **Clustering intelligent** des parcelles cadastrales
- 💰 **Marqueurs de transactions** avec popups détaillés
- 📊 **Graphiques Chart.js** : comparaison + distribution
- 📈 **KPIs dynamiques** : prix moyen/m², médian, surface, volume
- 🎨 **Responsive** : desktop, tablette, mobile
- 🗜️ **Décompression gzip native** via `DecompressionStream`

---

## 🚀 Démarrage rapide

### Prérequis

- Navigateur moderne (Chrome, Firefox, Safari, Edge)
- `python3` (serveur local)
- `curl` + `gunzip` (téléchargement des données)
- [Git LFS](https://git-lfs.com/) (clone du dépôt)

### Installation

Étape 1 — Cloner le dépôt :

    git lfs install
    git clone https://github.com/gunout/marseille-immobilier.git
    cd marseille-immobilier

Étape 2 — (Optionnel) Télécharger les données manuellement :

    chmod +x download_data.sh
    ./download_data.sh

Étape 3 — Lancer le serveur local :

    python3 -m http.server 8000

Étape 4 — Ouvrir dans le navigateur :

    http://localhost:8000

⚠️ **Important** : ne pas ouvrir `index.html` en `file://` — `fetch()` et `DecompressionStream` seraient bloqués par la politique CORS du navigateur.

---

## 📂 Structure du projet

    marseille-immobilier/
    ├── index.html                    # Dashboard complet (SPA)
    ├── download_data.sh              # Téléchargement des données
    ├── README.md
    ├── LICENSE
    ├── .gitattributes                # Config Git LFS
    ├── .gitignore
    └── data/
        ├── cadastre-13201-parcelles.json.gz
        ├── cadastre-13202-parcelles.json.gz
        ├── ...
        └── cadastre-13216-parcelles.json.gz

---

## 📊 Données

### Sources

| Source | Description | Licence |
|---|---|---|
| [Cadastre Etalab](https://cadastre.data.gouv.fr/) | Parcelles cadastrales (GeoJSON) | Licence Ouverte 2.0 |
| [DVF](https://app.dvf.etalab.gouv.fr/) | Demandes de Valeurs Foncières | Licence Ouverte 2.0 |
| [OpenStreetMap](https://www.openstreetmap.org/) | Fond de carte | ODbL |

### Arrondissements de Marseille

| Code INSEE | Arrondissement | Code INSEE | Arrondissement |
|:---:|:---|:---:|:---|
| 13201 | Marseille 1er  | 13209 | Marseille 9e  |
| 13202 | Marseille 2e   | 13210 | Marseille 10e |
| 13203 | Marseille 3e   | 13211 | Marseille 11e |
| 13204 | Marseille 4e   | 13212 | Marseille 12e |
| 13205 | Marseille 5e   | 13213 | Marseille 13e |
| 13206 | Marseille 6e   | 13214 | Marseille 14e |
| 13207 | Marseille 7e   | 13215 | Marseille 15e |
| 13208 | Marseille 8e   | 13216 | Marseille 16e |

---

## 🎯 Utilisation

1. **Sélectionner un arrondissement** (menu en haut à droite) ou « Tous »
2. **Explorer la carte** : points **gris** = parcelles, **rouges** = transactions
3. **Consulter les KPIs** (bas gauche)
4. **Analyser le graphique** (gauche)

---

## 🔧 Personnalisation

Modifier l'objet `STATS_ARRONDISSEMENTS` dans `index.html` :

    const STATS_ARRONDISSEMENTS = {
      '13201': {
        nom: 'Marseille 1er',
        prix_m2_moyen: 2850,
        nb_transactions: 290,
        surface_moyenne: 46,
        prix_median: 135000
      }
    };

---

## 🤝 Contribution

Les contributions sont les bienvenues.

    git checkout -b feature/ma-super-feature
    git commit -m "✨ Ajout de ma super feature"
    git push origin feature/ma-super-feature

Puis ouvrir une **Pull Request**.

### Convention de commits

| Emoji | Type | Description |
|:---:|---|---|
| ✨ | `feat` | Nouvelle fonctionnalité |
| 🐛 | `fix` | Correction de bug |
| 📝 | `docs` | Documentation |
| 🎨 | `style` | Formatage / UI |
| ♻️ | `refactor` | Refactorisation |
| ⚡ | `perf` | Performance |
| 🔧 | `chore` | Maintenance |

---

## 📄 Licence

Projet sous licence **MIT** — voir [LICENSE](LICENSE).

Les données restent sous leurs licences respectives :

- **Cadastre Etalab** → Licence Ouverte 2.0
- **DVF** → Licence Ouverte 2.0
- **OpenStreetMap** → ODbL

---

## 🙏 Remerciements

[Etalab](https://www.etalab.gouv.fr/) · [DGFiP](https://www.impots.gouv.fr/) · [Leaflet](https://leafletjs.com/) · [Chart.js](https://www.chartjs.org/) · [OpenStreetMap](https://www.openstreetmap.org/)

---

**Fait avec ❤️ à Marseille** — *« Ah, si vous saviez… »*

---

<div align="center">

### 🇫🇷 Gunout · 2026

![Made in France](https://img.shields.io/badge/Made_in-France-002395?style=flat-square&labelColor=FFFFFF&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA5MDAgNjAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjYwMCIgZmlsbD0iIzAwMjM5NSIvPjxyZWN0IHdpZHRoPSI5MDAiIGhlaWdodD0iNDAwIiB5PSIxMDAiIGZpbGw9IiNmZmYiLz48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjIwMCIgeT0iNDAwIiBmaWxsPSIjZWQyOTM5Ii8+PC9zdmc+)
![GitHub](https://img.shields.io/badge/GitHub-gunout-181717?style=flat-square&logo=github&logoColor=white)
![Year](https://img.shields.io/badge/2026-ED2939?style=flat-square&labelColor=FFFFFF)

<sub>© 2026 <strong>Gunout</strong> — Tous droits réservés.</sub>

</div>
