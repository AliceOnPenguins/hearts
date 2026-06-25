{ self, inputs, ... }: {
    flake.homeModules.mimeApps = { pkgs, lib, ... }: {
          xdg.mimeApps = {
              enable = true;
              defaultApplications = {
                # Browser
                "x-scheme-handler/http" = "zen-twilight.desktop";
                "x-scheme-handler/https" = "zen-twilight.desktop";
                "x-scheme-handler/about" = "zen-twilight.desktop";
                "x-scheme-handler/unknown" = "zen-twilight.desktop";
                # "text/html" = "zen-twilight.desktop";
          
                # Text / code
                "text/plain" = "nvim.desktop";
                "text/markdown" = "nvim.desktop";
                "text/x-python" = "nvim.desktop";
                "text/x-python3" = "nvim.desktop";
                "text/x-lua" = "nvim.desktop";
                "text/x-shellscript" = "nvim.desktop";
                "text/x-rust" = "nvim.desktop";
                "text/css" = "nvim.desktop";
                "text/javascript" = "nvim.desktop";
                "text/x-go" = "nvim.desktop";
                "text/x-java" = "nvim.desktop";
                "text/x-csrc" = "nvim.desktop";
                "text/x-c++src" = "nvim.desktop";
                "text/csv" = "nvim.desktop";
                "application/json" = "nvim.desktop";
                "application/toml" = "nvim.desktop";
                "application/x-yaml" = "nvim.desktop";
          
                # Images
                "image/png" = "oculante.desktop";
                "image/jpeg" = "oculante.desktop";
                "image/webp" = "oculante.desktop";
                "image/avif" = "oculante.desktop";
                "image/bmp" = "oculante.desktop";
                "image/gif" = "oculante.desktop";
                "image/tiff" = "oculante.desktop";
                "image/svg+xml" = "oculante.desktop";
                "image/heif" = "oculante.desktop";
                "image/x-xcursor" = "oculante.desktop";
          
                # Video
                "video/mp4" = "mpv.desktop";
                "video/webm" = "mpv.desktop";
                "video/x-matroska" = "mpv.desktop";
                "video/avi" = "mpv.desktop";
                "video/x-msvideo" = "mpv.desktop";
                "video/quicktime" = "mpv.desktop";
                "video/mpeg" = "mpv.desktop";
                "video/ogg" = "mpv.desktop";
                "video/flv" = "mpv.desktop";
                "video/x-flv" = "mpv.desktop";
                "video/x-ms-wmv" = "mpv.desktop";
                "video/3gpp" = "mpv.desktop";
                "video/3gpp2" = "mpv.desktop";
                "video/mp2t" = "mpv.desktop";
                "video/x-ogm+ogg" = "mpv.desktop";
                "application/x-matroska" = "mpv.desktop";
          
                # Audio
                "audio/mpeg" = "mpv.desktop";
                "audio/ogg" = "mpv.desktop";
                "audio/flac" = "mpv.desktop";
                "audio/wav" = "mpv.desktop";
                "audio/x-wav" = "mpv.desktop";
                "audio/mp4" = "mpv.desktop";
                "audio/aac" = "mpv.desktop";
                "audio/opus" = "mpv.desktop";
                "audio/x-speex" = "mpv.desktop";
                "audio/webm" = "mpv.desktop";
          
                # PDF
                "application/pdf" = "zen-twilight.desktop";
          
                # Directories
                "inode/directory" = "yazi.desktop";
              };
          };
      };
  }
