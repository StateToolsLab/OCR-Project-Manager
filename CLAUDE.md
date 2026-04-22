# CLAUDE.md
Guidance for Claude Code when working with this repository.

## Running the App

Standard launch: python3 start.py
Direct launch: python3 app.py
Both open http://localhost:5050

## Dependencies
pip3 install flask Pillow pdf2image
brew install poppler  # macOS
NDLOCR-Lite: install separately at ~/ndlocr-lite/

## Architecture
Single Flask app (app.py) + SPA frontend (templates/index.html)
State stored under ~/OCR_Projects/

## Module Structure
app.py           - Core Flask app. All routes: OCR/PDF/crop/re-OCR/correction dict. Port 5050.
start.py         - Launcher: checks deps, spawns app.py if OK, shows install UI if missing.
templates/index.html - Full frontend SPA (vanilla JS).

## Key Design Points
Overlay system: edits in <stem>_overlay.json, never written to NDLOCR JSON.
OCR execution: daemon thread, sys.executable for venv stability.
Re-OCR: per-block crop + NDLOCR. Supports Lite and Lite+ (simple-mode).
PDF: convert_pdf_to_images() in app.py. Requires pdf2image + poppler.
Correction dict: per-project correction_dict.json.
Writing direction: stored in meta.json as writing_direction.
