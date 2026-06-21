{ self, inputs, ... }: {
  flake.homeModules.rmpc = { pkgs, lib, ... }: {
    programs.rmpc = {
      enable = true;
      config = ''
        #![enable(implicit_some)]
        #![enable(unwrap_newtypes)]
        #![enable(unwrap_variant_newtypes)]
        (
            address: "/run/user/1000/mpd/socket",
            password: None,
            theme: "gruvbox",
            enable_config_hot_reload: true,
            cache_dir: None,
            on_song_change: None,
            volume_step: 5,
            max_fps: 60,
            scrolloff: 0,
            wrap_navigation: false,
            enable_mouse: true,
            status_update_interval_ms: 1000,
            select_current_song_on_change: false,
            album_art: (
                method: Auto,
                max_size_px: (width: 500, height: 500),
                disabled_protocols: ["http://", "https://"],
                vertical_align: Center,
                horizontal_align: Center,
            ),
            keybinds: (
                global: {
                    ":":       CommandMode,
                    ",":       VolumeDown,
                    "s":       Stop,
                    ".":       VolumeUp,
                    "<Tab>":   NextTab,
                    "<S-Tab>": PreviousTab,
                    "1":       SwitchToTab("Playing"),
                    "4":       SwitchToTab("Dir"),
                    "3":       SwitchToTab("Lists"),
                    "2":       SwitchToTab("Find"),
                    "q":       Quit,
                    ">":       NextTrack,
                    "p":       TogglePause,
                    "<":       PreviousTrack,
                    "f":       SeekForward,
                    "z":       ToggleRepeat,
                    "x":       ToggleRandom,
                    "c":       ToggleConsume,
                    "v":       ToggleSingle,
                    "b":       SeekBack,
                    "~":       ShowHelp,
                    "I":       ShowCurrentSongInfo,
                    "O":       ShowOutputs,
                    "P":       ShowDecoders,
                },
                navigation: {
                    "k":         Up,
                    "j":         Down,
                    "h":         Left,
                    "l":         Right,
                    "<Up>":      Up,
                    "<Down>":    Down,
                    "<Left>":    Left,
                    "<Right>":   Right,
                    "<C-k>":     PaneUp,
                    "<C-j>":     PaneDown,
                    "<C-h>":     PaneLeft,
                    "<C-l>":     PaneRight,
                    "<C-u>":     UpHalf,
                    "N":         PreviousResult,
                    "a":         Add,
                    "A":         AddAll,
                    "r":         Rename,
                    "n":         NextResult,
                    "g":         Top,
                    "<Space>":   Select,
                    "<C-Space>": InvertSelection,
                    "G":         Bottom,
                    "<CR>":      Confirm,
                    "i":         FocusInput,
                    "J":         MoveDown,
                    "<C-d>":     DownHalf,
                    "/":         EnterSearch,
                    "<C-c>":     Close,
                    "<Esc>":     Close,
                    "K":         MoveUp,
                    "D":         Delete,
                },
                queue: {
                    "D":       DeleteAll,
                    "<CR>":    Play,
                    "<C-s>":   Save,
                    "a":       AddToPlaylist,
                    "d":       Delete,
                    "i":       ShowInfo,
                    "C":       JumpToCurrent,
                },
            ),
            search: (
                case_sensitive: false,
                mode: Contains,
                tags: [
                    (value: "any",      label: "Any Tag"),
                    (value: "title",    label: "Title"),
                    (value: "album",    label: "Album"),
                    (value: "artist",   label: "Artist"),
                    (value: "filename", label: "Filename"),
                    (value: "genre",    label: "Genre"),
                ],
            ),
            artists: (
                album_display_mode: SplitByDate,
                album_sort_by: Date,
            ),
            tabs: [
                (
                    name: "Playing",
                    pane: Split(
                        direction: Horizontal,
                        panes: [
                            (size: "65%", pane: Pane(Queue)),
                            (size: "35%", pane: Pane(AlbumArt)),
                        ],
                    ),
                ),
                (
                    name: "Find",
                    pane: Pane(Search),
                ),
                (
                    name: "Lists",
                    pane: Pane(Playlists),
                ),
                (
                    name: "Dir",
                    pane: Pane(Directories),
                ),
            ],
        )
      '';
    };

    xdg.configFile."rmpc/themes/gruvbox.ron".text = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
          default_album_art_path: None,
          format_tag_separator: " | ",
          browser_column_widths: [20, 38, 42],
          background_color: None,
          text_color: "#ebdbb2",
          header_background_color: None,
          modal_background_color: None,
          modal_backdrop: false,
          preview_label_style: (fg: "#fabd2f"),
          preview_metadata_group_style: (fg: "#fabd2f", modifiers: "Bold"),
          highlighted_item_style: (fg: "#fabd2f", modifiers: "Bold"),
          current_item_style: (fg: "#1d2021", bg: "#fabd2f", modifiers: "Bold"),
          borders_style: (fg: "#83a598"),
          highlight_border_style: (fg: "#fabd2f"),
          symbols: (
              song: "S",
              dir: "D",
              playlist: "P",
              marker: "M",
              ellipsis: "...",
              song_style: None,
              dir_style: None,
              playlist_style: None,
          ),
          level_styles: (
              info: (fg: "#83a598", bg: "#1d2021"),
              warn: (fg: "#fabd2f", bg: "#1d2021"),
              error: (fg: "#fb4934", bg: "#1d2021"),
              debug: (fg: "#8ec07c", bg: "#1d2021"),
              trace: (fg: "#928374", bg: "#1d2021"),
          ),
          progress_bar: (
              symbols: ["█", "█", "█", " ", "█"],
              track_style: None,
              elapsed_style: (fg: "#fabd2f"),
              thumb_style: (fg: "#fabd2f"),
              use_track_when_empty: true,
          ),
          scrollbar: (
              symbols: ["│", "█", "▲", "▼"],
              track_style: (),
              ends_style: (),
              thumb_style: (fg: "#83a598"),
          ),
          tab_bar: (
              active_style: (fg: "#1d2021", bg: "#fabd2f", modifiers: "Bold"),
              inactive_style: (fg: "#ebdbb2"),
          ),
          lyrics: (
              timestamp: false
          ),
          browser_song_format: [
              (
                  kind: Group([
                      (kind: Property(Track)),
                      (kind: Text(" ")),
                  ])
              ),
              (
                  kind: Group([
                      (kind: Property(Artist)),
                      (kind: Text(" - ")),
                      (kind: Property(Title)),
                  ]),
                  default: (kind: Property(Filename))
              ),
          ],
          song_table_format: [
              (
                  prop: (kind: Property(Artist),
                      default: (kind: Text("Unknown"))
                  ),
                  label_prop: (kind: Text("Artist")),
                  width: "20%",
              ),
              (
                  prop: (kind: Property(Title),
                      default: (kind: Text("Unknown"))
                  ),
                  label_prop: (kind: Text("Title")),
                  width: "35%",
              ),
              (
                  prop: (kind: Property(Album), style: (fg: "#ebdbb2"),
                      default: (kind: Text("Unknown Album"), style: (fg: "#ebdbb2"))
                  ),
                  label_prop: (kind: Text("Album")),
                  width: "30%",
              ),
              (
                  prop: (kind: Property(Duration),
                      default: (kind: Text("-"))
                  ),
                  label_prop: (kind: Text("Duration")),
                  width: "15%",
                  alignment: Right,
              ),
          ],
          layout: Split(
              direction: Vertical,
              panes: [
                  (
                      size: "4",
                      pane: Split(
                          direction: Horizontal,
                          panes: [
                              (
                                  size: "35",
                                  borders: "LEFT | TOP | BOTTOM",
                                  border_symbols: Inherited(parent: Rounded, bottom_left: "├"),
                                  pane: Component("header_left")
                              ),
                              (
                                  size: "100%",
                                  borders: "ALL",
                                  border_symbols: Inherited(parent: Rounded, top_left: "┬", top_right: "┬", bottom_left: "┴", bottom_right: "┴"),
                                  pane: Component("header_center")
                              ),
                              (
                                  size: "35",
                                  borders: "RIGHT | TOP | BOTTOM",
                                  border_symbols: Inherited(parent: Rounded, bottom_right: "┤"),
                                  pane: Component("header_right")
                              ),
                          ]
                      )
                  ),
                  (
                      pane: Pane(Tabs),
                      borders: "RIGHT | LEFT | BOTTOM",
                      border_symbols: Rounded,
                      size: "2",
                  ),
                  (
                      pane: Pane(TabContent),
                      size: "100%",
                  ),
                  (
                      size: "3",
                      pane: Split(
                          direction: Horizontal,
                          panes: [
                              (
                                  size: "12",
                                  borders: "ALL",
                                  border_symbols: Inherited(parent: Rounded, top_right: "┬", bottom_right: "┴"),
                                  pane: Component("input_mode")
                              ),
                              (
                                  size: "100%",
                                  borders: "TOP | BOTTOM | RIGHT",
                                  border_symbols: Rounded,
                                  border_title: [(kind: Text(" ")), (kind: Property(Status(QueueLength()))), (kind: Text(" songs / ")), (kind: Property(Status(QueueTimeTotal()))), (kind: Text(" total time "))],
                                  border_title_alignment: Right,
                                  pane: Component("progress_bar"),
                              ),
                          ]
                      ),
                  ),
              ],
          ),
          components: {
              "state": Pane(Property(
                  content: [
                      (kind: Text("["), style: (fg: "#fabd2f", modifiers: "Bold")),
                      (kind: Property(Status(StateV2( ))), style: (fg: "#fabd2f", modifiers: "Bold")),
                      (kind: Text("]"), style: (fg: "#fabd2f", modifiers: "Bold")),
                  ], align: Left,
              )),
              "title": Pane(Property(
                  content: [
                      (kind: Property(Song(Title)), style: (modifiers: "Bold"),
                          default: (kind: Text("No Song"), style: (modifiers: "Bold"))),
                  ], align: Center, scroll_speed: 1
              )),
              "volume": Split(
                  direction: Horizontal,
                  panes: [
                      (size: "1", pane: Pane(Property(content: [(kind: Text(""))]))),
                      (size: "100%", pane: Pane(Volume(kind: Slider(symbols: (filled: "─", thumb: "●", track: "─"))))),
                      (size: "3", pane: Pane(Property(content: [(kind: Property(Status(Volume)), style: (fg: "#83a598"))], align: Right))),
                      (size: "2", pane: Pane(Property(content: [(kind: Text("%"), style: (fg: "#83a598"))]))),
                  ]
              ),
              "elapsed_and_bitrate": Pane(Property(
                  content: [
                      (kind: Property(Status(Elapsed))),
                      (kind: Text(" / ")),
                      (kind: Property(Status(Duration))),
                      (kind: Group([
                          (kind: Text(" (")),
                          (kind: Property(Status(Bitrate))),
                          (kind: Text(" kbps)")),
                      ])),
                  ],
                  align: Left,
              )),
              "artist_and_album": Pane(Property(
                  content: [
                      (kind: Property(Song(Artist)), style: (fg: "#fabd2f", modifiers: "Bold"),
                          default: (kind: Text("Unknown"), style: (fg: "#fabd2f", modifiers: "Bold"))),
                      (kind: Text(" - ")),
                      (kind: Property(Song(Album)), default: (kind: Text("Unknown Album"))),
                  ], align: Center, scroll_speed: 1
              )),
              "states": Split(
                  direction: Horizontal,
                  panes: [
                      (
                          size: "1",
                          pane: Pane(Empty())
                      ),
                      (
                          size: "100%",
                          pane: Pane(Property(content: [(kind: Property(Status(InputBuffer())), style: (fg: "#83a598"), align: Left)]))
                      ),
                      (
                          size: "6",
                          pane: Pane(Property(content: [
                              (kind: Text("["), style: (fg: "#83a598", modifiers: "Bold")),
                              (kind: Property(Status(RepeatV2(
                                  on_label: "z",
                                  off_label: "z",
                                  on_style: (fg: "#fabd2f", modifiers: "Bold"),
                                  off_style: (fg: "#83a598", modifiers: "Dim"),
                              )))),
                              (kind: Property(Status(RandomV2(
                                  on_label: "x",
                                  off_label: "x",
                                  on_style: (fg: "#fabd2f", modifiers: "Bold"),
                                  off_style: (fg: "#83a598", modifiers: "Dim"),
                              )))),
                              (kind: Property(Status(ConsumeV2(
                                  on_label: "c",
                                  off_label: "c",
                                  oneshot_label: "c",
                                  on_style: (fg: "#fabd2f", modifiers: "Bold"),
                                  off_style: (fg: "#83a598", modifiers: "Dim"),
                                  oneshot_style: (fg: "#fb4934", modifiers: "Dim"),
                              )))),
                              (kind: Property(Status(SingleV2(
                                  on_label: "v",
                                  off_label: "v",
                                  oneshot_label: "v",
                                  on_style: (fg: "#fabd2f", modifiers: "Bold"),
                                  off_style: (fg: "#83a598", modifiers: "Dim"),
                                  oneshot_style: (fg: "#fb4934", modifiers: "Bold"),
                              )))),
                              (kind: Text("]"), style: (fg: "#83a598", modifiers: "Bold")),
                              ],
                              align: Right
                          ))
                      ),
                  ]
              ),
              "input_mode": Pane(Property(
                  content: [
                      (kind: Transform(Replace(content: (kind: Property(Status(InputMode()))), replacements: [
                          (match: "Normal", replace: (kind: Text(" NORMAL "), style: (fg: "#1d2021", bg: "#83a598"))),
                          (match: "Insert", replace: (kind: Text(" INSERT "), style: (fg: "#1d2021", bg: "#fabd2f"))),
                      ])))
                  ], align: Center
              )),
              "header_left": Split(
                  direction: Vertical,
                  panes: [
                      (size: "1", pane: Component("state")),
                      (size: "1", pane: Component("elapsed_and_bitrate")),
                  ]
              ),
              "header_center": Split(
                  direction: Vertical,
                  panes: [
                      (size: "1", pane: Component("title")),
                      (size: "1", pane: Component("artist_and_album")),
                  ]
              ),
              "header_right": Split(
                  direction: Vertical,
                  panes: [
                      (size: "1", pane: Component("volume")),
                      (size: "1", pane: Component("states")),
                  ]
              ),
              "progress_bar": Split(
                  direction: Horizontal,
                  panes: [
                      (
                          size: "1",
                          pane: Pane(Empty())
                      ),
                      (
                          size: "100%",
                          pane: Pane(ProgressBar)
                      ),
                      (
                          size: "1",
                          pane: Pane(Empty())
                      ),
                  ]
              )
          },
      )
    '';
  };
}
