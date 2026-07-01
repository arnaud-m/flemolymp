# Copy documentation assets from doc/ into inst/doc
# This script is intended to be run manually before a release.

# Ensure target directory exists
dir.create("inst/doc", recursive = TRUE, showWarnings = FALSE)

# List of mandatory documentation assets to include in the package
files <- c(
  "algos-flemolymp.pdf",
  "manuel-flemolymp.pdf",
  "manuel-booklet-flemolymp.pdf",
  "instances-flemolymp.pdf",
  "instances-booklet-flemolymp.pdf",
  ## "presentation-flemolymp.pdf", ## 25Mo
  "code-flemolymp.pdf"
)

# Full source paths in doc/
src <- file.path("doc", files)

# Check for missing files before copying
# This ensures the release is complete and avoids partial documentation builds
missing <- src[!file.exists(src)]

if (length(missing) > 0) {
  stop(
    "Missing documentation assets:\n  ",
    paste(basename(missing), collapse = "\n  "),
    call. = FALSE
  )
}

# Copy files into inst/doc (package-shipped documentation folder)
ok <- file.copy(
  from = src,
  to = "inst/doc",
  overwrite = TRUE
)

# Verify that all files were successfully copied
if (!all(ok)) {
  stop("File copy failed for some documentation assets.", call. = FALSE)
}


message("Documentation assets successfully copied to inst/doc")
