# IMPHNEN Website

## Requirements

- NPM (WAJIB PAKE NPM) v10.9.0
- NodeJS (WAJIB PAKE NODEJS) v22.11.0

## Requirements Additional

- Python (WAJIB PIPENV) 3.9 version

## Recomended Tools

- Text Editor ( VSCode )
- ESLint Plugin (WAJIB PAKE ESLINT)
- Prettier Plugin (WAJIB PAKE PRETTIER)

## Branching Rule

- `main` branch is the production branch
- `staging` branch is the staging branch
- `develop` branch is the development branch

if you want to create a new feature, please create a new branch from `dev` branch and push to `dev` branch

with following naming convention:

- `feature/feature-name`

if you want to create a new bugfix, please create a new branch from `dev` branch and push to `dev` branch

with following naming convention:

- `bugfix/bugfix-name`

if you want to create a new thing that not very necessary (rename file, rename folder, change color), please create a new branch from `dev` branch and push to `dev` branch

with following naming convention:

- `chore/chore-name`

if you want to create a new release, please create a new branch from `main` branch and push to `main` branch

with following naming convention:

- `release/release-name`

## Commiting Rule

if you want to create a new feature, please create a new commit from `dev` branch and push to `dev` branch

with following naming convention:

- `chore: chore name`

if you want to create a new thing that not very necessary (rename file, rename folder, change color), please create a new commit from `dev` branch and push to `dev` branch

with following naming convention:

- `feature: feature name`

if you want to create a new bugfix, please create a new commit from `dev` branch and push to `dev` branch

with following naming convention:

- `bugfix: bugfix name`

## Setup and Run Project

1. Clone the repository

```bash
git clone https://github.com/IMPHNEN/imphnen-website.git
```

2. Install dependencies

```bash
npm install
```

3. Setup .env

```bash
cp .env.example .env
```

## Build Project

1. Install dependencies

```bash
npm run build
```

2. Run production

```bash
npm run preview
```

## Build with Docker

1. Build the image

```bash
docker build -t imphnen-website .
```

2. Run the container

```bash
docker run -p 3000:3000 imphnen-website
```

3. Run with compose

```bash
docker compose up -d
```
