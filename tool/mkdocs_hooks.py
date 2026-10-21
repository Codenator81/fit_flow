"""MkDocs hooks for the documentation site (see mkdocs.yml).

Adds every golden screenshot from test/goldens/screens/ to the site as
assets/screens/<name>.png. The PNGs stay in one place, and the site always
shows the screens the golden tests currently verify.
"""
from pathlib import Path

from mkdocs.structure.files import File

SCREENS = Path(__file__).resolve().parent.parent / "test" / "goldens" / "screens"


def on_files(files, config):
    for png in sorted(SCREENS.glob("*.png")):
        files.append(
            File.generated(config, f"assets/screens/{png.name}", abs_src_path=str(png))
        )
    return files
