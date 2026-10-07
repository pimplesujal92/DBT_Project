# Agent Guidance

## Project

- This is a minimal Python package named `dbt`; it is not currently a dbt-core project.
- Support Python 3.12 or newer, matching `.python-version` and `pyproject.toml`.
- The application entry point is `main.py`, which calls `main()` under the module guard.

## Workflow

- Use `uv` for dependency and environment management.
- Install or synchronize the environment with `uv sync`.
- Run the application with `uv run python main.py`.
- After changing dependencies or project metadata, update and verify `uv.lock` with `uv lock` or `uv sync`.
- Do not assume a `dbt` console command, dbt-core dependency, or external service is available.

## Validation

- No test, lint, or formatter configuration exists yet. Do not claim those checks pass until the corresponding tooling is added.
- For application changes, at minimum run `uv run python main.py` and inspect the output.
- Keep changes focused and preserve the existing project metadata unless the task requires updating it.

## Documentation

- Update `README.md` when user-facing setup or usage changes; it is currently empty.
