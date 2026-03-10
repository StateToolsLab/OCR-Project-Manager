# OCR Project Manager

A **research-oriented OCR workflow manager** built to work with the\
**NDLOCR-Lite** OCR engine developed by the National Diet Library of
Japan.

This tool provides a browser-based interface to manage the full OCR
workflow:

Scan → OCR → Review → Edit → Export

It is designed especially for **researchers, archivists, and digital
humanities projects** working with scanned Japanese texts and historical
materials.

All processing happens **locally on your machine**, so your data never
leaves your environment.

------------------------------------------------------------------------

# Features

-   Run OCR on scanned images using **NDLOCR-Lite**
-   Supports **vertical Japanese text** and historical documents
-   Highlights **low-confidence OCR regions** for easier review
-   Edit OCR results **block-by-block**
-   Rearrange blocks to correct reading order
-   Upload **PDF files** and automatically convert them into page images
    (v2)
-   **Crop and save** selected image regions (v2)
-   Export corrected text in **TXT** or **JSON** format
-   Simple **browser-based UI**

------------------------------------------------------------------------

# Workflow

Scanned Images / PDF\
↓\
Upload to Project\
↓\
Run OCR (NDLOCR-Lite)\
↓\
Review Confidence Overlay\
↓\
Correct Text Blocks\
↓\
Export Clean Text

This workflow allows scanned documents to be converted into **clean,
structured text** suitable for research and digital archiving.

------------------------------------------------------------------------

# Screenshots

*(Add screenshots in the docs folder)*

Example:

docs/screenshot_main.png\
docs/screenshot_export.png

------------------------------------------------------------------------

# Installation

## Requirements

-   Python 3.9+
-   NDLOCR-Lite

Install NDLOCR-Lite by following the official repository:

https://github.com/ndl-lab/ndlocr-lite

------------------------------------------------------------------------

## Clone this repository

git clone https://github.com/StateToolsLab/ocr-project-manager\
cd ocr-project-manager

------------------------------------------------------------------------

## Install dependencies

pip install -r requirements.txt

------------------------------------------------------------------------

## Run the server

python app.py

Then open:

http://localhost:5000

------------------------------------------------------------------------

# Usage

1.  Create a project
2.  Upload scanned images or a PDF
3.  Run OCR
4.  Review highlighted low-confidence areas
5.  Edit text blocks if necessary
6.  Export clean text

------------------------------------------------------------------------

# Architecture

OCR Project Manager acts as a **workflow layer** on top of NDLOCR-Lite.

NDLOCR-Lite (OCR Engine)\
↓\
OCR Project Manager\
↓\
Manual Review / Block Editing\
↓\
Text Export (TXT / JSON)

This design separates **OCR execution** from **human review and
correction**, making the workflow more efficient.

------------------------------------------------------------------------

# Use Cases

-   Historical document transcription
-   Digital humanities research
-   Archive digitization projects
-   OCR-assisted proofreading
-   Japanese classical text processing

------------------------------------------------------------------------

# Privacy

All OCR processing and data storage happen **locally**.

No document data is sent to external servers.

------------------------------------------------------------------------

# License

MIT License

------------------------------------------------------------------------

# Author

Developed by **StateToolsLab**

https://github.com/StateToolsLab

------------------------------------------------------------------------

# Acknowledgements

-   National Diet Library (NDLOCR Project)
-   NDLOCR-Lite Contributors
