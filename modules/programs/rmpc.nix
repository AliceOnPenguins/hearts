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
                  theme: "aroace",
                  cache_dir: ".rmpc/cache/",
                  on_song_change: None,
                  volume_step: 5,
                  max_fps: 60,
                  scrolloff: 0,
                  wrap_navigation: false,
                  enable_mouse: true,
                  scroll_amount: 1,
                  enable_config_hot_reload: true,
                  enable_lyrics_hot_reload: false,
                  status_update_interval_ms: 1000,
                  rewind_to_start_sec: None,
                  keep_state_on_song_change: true,
                  reflect_changes_to_playlist: false,
                  select_current_song_on_change: false,
                  ignore_leading_the: false,
                  browser_song_sort: [Disc, Track, Artist, Title],
                  directories_sort: SortFormat(group_by_type: true, reverse: false),
                  auto_open_downloads: true,
                  album_art: (
                      method: Auto,
                      max_size_px: (width: 1200, height: 1200),
                      disabled_protocols: ["http://", "https://"],
                      vertical_align: Center,
                      horizontal_align: Center,
                  ),
                  keybinds: (
                      global: {
                          "q":          Quit,
                          "?":          ShowHelp,
                          ":":          CommandMode,
                          "oI":         ShowCurrentSongInfo,
                          "oo":         ShowOutputs,
                          "op":         ShowDecoders,
                          "od":         ShowDownloads,
                          "oP":         Partition(),
                          "z":          ToggleRepeat,
                          "x":          ToggleRandom,
                          "c":          ToggleConsume,
                          "v":          ToggleSingle,
                          "p":          TogglePause,
                          "s":          Stop,
                          ">":          NextTrack,
                          "<":          PreviousTrack,
                          "f":          SeekForward,
                          "b":          SeekBack,
                          ".":          VolumeUp,
                          ",":          VolumeDown,
                          "<Tab>":      NextTab,
                          "gt":         NextTab,
                          "<S-Tab>":    PreviousTab,
                          "gT":         PreviousTab,
                          "1":          SwitchToTab("Queue"),
                          "2":          SwitchToTab("Directories"),
                          "3":          SwitchToTab("Artists"),
                          "4":          SwitchToTab("Album Artists"),
                          "5":          SwitchToTab("Albums"),
                          "6":          SwitchToTab("Playlists"),
                          "7":          SwitchToTab("Search"),
                          "<C-u>":      Update,
                          "<C-U>":      Rescan,
                          "R":          AddRandom,
                      },
                      navigation: {
                          "<C-c>":      Close,
                          "<Esc>":      Close,
                          "<CR>":       Confirm,
                          "k":          Up,
                          "<Up>":       Up,
                          "j":          Down,
                          "<Down>":     Down,
                          "h":          Left,
                          "<Left>":     Left,
                          "l":          Right,
                          "<Right>":    Right,
                          "<C-w>k":     PaneUp,
                          "<C-Up>":     PaneUp,
                          "<C-w>j":     PaneDown,
                          "<C-Down>":   PaneDown,
                          "<C-w>h":     PaneLeft,
                          "<C-Left>":   PaneLeft,
                          "<C-w>l":     PaneRight,
                          "<C-Right>":  PaneRight,
                          "K":          MoveUp,
                          "J":          MoveDown,
                          "<C-u>":      UpHalf,
                          "<C-d>":      DownHalf,
                          "<C-b>":      PageUp,
                          "<PageUp>":   PageUp,
                          "<C-f>":      PageDown,
                          "<PageDown>": PageDown,
                          "gg":         Top,
                          "G":          Bottom,
                          "<Space>":    Select,
                          "<C-Space>":  InvertSelection,
                          "/":          EnterSearch,
                          "n":          NextResult,
                          "N":          PreviousResult,
                          "a":          Add,
                          "A":          AddAll,
                          "D":          Delete,
                          "<C-r>":      Rename,
                          "i":          FocusInput,
                          "oi":         ShowInfo,
                          "<C-z>":      ContextMenu(),
                          "<C-s>s":     Save(kind: Modal(all: false, duplicates_strategy: Ask)),
                          "<C-s>a":     Save(kind: Modal(all: true, duplicates_strategy: Ask)),
                          "r":          Rate(),
                      },
                      queue: {
                          "d":          Delete,
                          "D":          DeleteAll,
                          "<CR>":       Play,
                          "C":          JumpToCurrent,
                          "X":          Shuffle,
                      },
                  ),
                  search: (
                      case_sensitive: false,
                      ignore_diacritics: false,
                      search_button: false,
                      mode: Contains,
                      tags: [
                          (value: "any",         label: "Any Tag"),
                          (value: "artist",      label: "Artist"),
                          (value: "album",       label: "Album"),
                          (value: "albumartist", label: "Album Artist"),
                          (value: "title",       label: "Title"),
                          (value: "filename",    label: "Filename"),
                          (value: "genre",       label: "Genre"),
                      ],
                  ),
                  artists: (
                      album_display_mode: SplitByDate,
                      album_sort_by: Date,
                      album_date_tags: [Date],
                  ),
                  tabs: [
                      (
                          name: "Queue",
                          pane: Split(
                              direction: Horizontal,
                              panes: [
                                  (
                                      size: "35%",
                                      pane: Split(
                                          direction: Vertical,
                                          panes: [
                                              (
                                                  size: "100%",
                                                  borders: "LEFT | RIGHT | TOP",
                                                  border_symbols: Rounded,
                                                  pane: Pane(AlbumArt)
                                              ),
                                              (
                                                  size: "7",
                                                  borders: "ALL",
                                                  border_symbols: Inherited(parent: Rounded, top_left: "├", top_right: "┤",),
                                                  border_title: [(kind: Text(" Lyrics "))],
                                                  border_title_alignment: Right,
                                                  pane: Pane(Lyrics)
                                              ),
                                          ],
                                      ),
                                  ), 
                                  (
                                      size: "65%",
                                      pane: Split(
                                          direction: Vertical,
                                          panes: [
                                              (
                                                  size: "3",
                                                  borders: "ALL",
                                                  border_symbols: Inherited(parent: Rounded, bottom_left: "├", bottom_right: "┤",),
                                                  pane: Split(
                                                      direction: Horizontal,
                                                      panes: [
                                                          (
                                                              size: "1",
                                                              pane: Pane(Empty())
                                                          ),
                                                          (
                                                              size: "100%",
                                                              pane: Pane(QueueHeader())
                                                          ),
                                                      ]
                                                  )
                                              ),
                                              (
                                                  size: "100%",
                                                  borders: "LEFT | RIGHT | BOTTOM",
                                                  border_symbols: Rounded,
                                                  pane: Split(
                                                      direction: Horizontal,
                                                      panes: [
                                                          (
                                                              size: "1",
                                                              pane: Pane(Empty())
                                                          ),
                                                          (
                                                              size: "100%",
                                                              pane: Pane(Queue)
                                                          ),
                                                      ]
                                                  )
                                              ),
                                          ],
                                      )
                                  ),
                              ],
                          ),
                      ),
                      (
                          name: "Directories",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(Directories), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                      (
                          name: "Artists",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(Artists), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                      (
                          name: "Album Artists",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(AlbumArtists), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                      (
                          name: "Albums",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(Albums), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                      (
                          name: "Playlists",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(Playlists), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                      (
                          name: "Search",
                          borders: "ALL",
                          border_symbols: Rounded,
                          pane: Split(
                              size: "100%",
                              direction: Vertical,
                              panes: [(pane: Pane(Search), size: "100%", borders: "ALL", border_symbols: Rounded)],
                          )
                      ),
                  ],
              )
            }
        '';
      };
    
      xdg.configFile."rmpc/themes/aroace.ron".text = ''
        
        #![enable(implicit_some)]
        #![enable(unwrap_newtypes)]
        #![enable(unwrap_variant_newtypes)]
        (
            default_album_art_path: None,
            format_tag_separator: " | ",
            browser_column_widths: [20, 38, 42],
            background_color: None,
            text_color: "#FAF0E4",
            header_background_color: None,
            modal_background_color: None,
            modal_backdrop: false,
            preview_label_style: (fg: "#F2B870"),
            preview_metadata_group_style: (fg: "#F2B870", modifiers: "Bold"),
            highlighted_item_style: (fg: "#F2B870", modifiers: "Bold"),
            current_item_style: (fg: "#070707", bg: "#F2B870", modifiers: "Bold"),
            borders_style: (fg: "#8BBFD6"),
            highlight_border_style: (fg: "#F2B870"),
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
                info: (fg: "#8BBFD6", bg: "#070707"),
                warn: (fg: "#F2B870", bg: "#070707"),
                error: (fg: "#D4431A", bg: "#070707"),
                debug: (fg: "#A8D4E6", bg: "#070707"),
                trace: (fg: "#6A9AB8", bg: "#070707"),
            ),
            progress_bar: (
                symbols: ["█", "█", "█", " ", "█"],
                track_style: None,
                elapsed_style: (fg: "#F2B870"),
                thumb_style: (fg: "#F2B870"),
                use_track_when_empty: true,
            ),
            scrollbar: (
                symbols: ["│", "█", "▲", "▼"],
                track_style: (),
                ends_style: (),
                thumb_style: (fg: "#8BBFD6"),
            ),
            tab_bar: (
                active_style: (fg: "#070707", bg: "#F2B870", modifiers: "Bold"),
                inactive_style: (fg: "#FAF0E4"),
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
                    prop: (kind: Property(Album), style: (fg: "#FAF0E4"),
                        default: (kind: Text("Unknown Album"), style: (fg: "#FAF0E4"))
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
                        (kind: Text("["), style: (fg: "#F2B870", modifiers: "Bold")),
                        (kind: Property(Status(StateV2( ))), style: (fg: "#F2B870", modifiers: "Bold")),
                        (kind: Text("]"), style: (fg: "#F2B870", modifiers: "Bold")),
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
                        (size: "3", pane: Pane(Property(content: [(kind: Property(Status(Volume)), style: (fg: "#8BBFD6"))], align: Right))),
                        (size: "2", pane: Pane(Property(content: [(kind: Text("%"), style: (fg: "#8BBFD6"))]))),
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
                        (kind: Property(Song(Artist)), style: (fg: "#F2B870", modifiers: "Bold"),
                            default: (kind: Text("Unknown"), style: (fg: "#F2B870", modifiers: "Bold"))),
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
                            pane: Pane(Property(content: [(kind: Property(Status(InputBuffer())), style: (fg: "#8BBFD6"), align: Left)]))
                        ),
                        (
                            size: "6",
                            pane: Pane(Property(content: [
                                (kind: Text("["), style: (fg: "#8BBFD6", modifiers: "Bold")),
                                (kind: Property(Status(RepeatV2(
                                    on_label: "z",
                                    off_label: "z",
                                    on_style: (fg: "#F2B870", modifiers: "Bold"),
                                    off_style: (fg: "#8BBFD6", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(RandomV2(
                                    on_label: "x",
                                    off_label: "x",
                                    on_style: (fg: "#F2B870", modifiers: "Bold"),
                                    off_style: (fg: "#8BBFD6", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(ConsumeV2(
                                    on_label: "c",
                                    off_label: "c",
                                    oneshot_label: "c",
                                    on_style: (fg: "#F2B870", modifiers: "Bold"),
                                    off_style: (fg: "#8BBFD6", modifiers: "Dim"),
                                    oneshot_style: (fg: "#D4431A", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(SingleV2(
                                    on_label: "v",
                                    off_label: "v",
                                    oneshot_label: "v",
                                    on_style: (fg: "#F2B870", modifiers: "Bold"),
                                    off_style: (fg: "#8BBFD6", modifiers: "Dim"),
                                    oneshot_style: (fg: "#D4431A", modifiers: "Bold"),
                                )))),
                                (kind: Text("]"), style: (fg: "#8BBFD6", modifiers: "Bold")),
                                ],
                                align: Right
                            ))
                        ),
                    ]
                ),
                "input_mode": Pane(Property(
                    content: [
                        (kind: Transform(Replace(content: (kind: Property(Status(InputMode()))), replacements: [
                            (match: "Normal", replace: (kind: Text(" NORMAL "), style: (fg: "#070707", bg: "#8BBFD6"))),
                            (match: "Insert", replace: (kind: Text(" INSERT "), style: (fg: "#070707", bg: "#F2B870"))),
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
