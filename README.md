## vim configuration for colemak user
The most basic configuration, without any plug-ins.
### Keyboard Shortcuts
`<leader>` = `<space>`
#### 1 Basic Editor Features
##### 1.1 The Most Basics
**`u`** : switchs to **`INSERT`** : mode (same as key `i` in vanilla vim)

**`Q`** : quits current vim window (same as command `:q` in vanilla vim)

**`S`** : saves the current file (same as command `:w` in vanilla vim)

**_IMPORTANT_**

  Since the `i` key has been mapped to `u`, every command (combination) that involves `i` should use `u` instead (for example, `ciw` should be `cuw`).

##### 1.2 Remapped Cursor Movement
| Shortcut   | Action                                                    | Equivalent |
|------------|-----------------------------------------------------------|------------|
| `e`        | Cursor up a terminal line                                 | `k`        |
| `n`        | Cursor down a terminal line                               | `j`        |
| `h`        | Cursor left                                               | `h`        |
| `i`        | Cursor right                                              | `l`        |
| `E`        | Cursor up 5 terminal lines                                | `5k`       |
| `N`        | Cursor down 5 terminal lines                              | `5j`       |
| `H`        | Cursor to the start of the line                           | `0`        |
| `I`        | Cursor to the end of the line                             | `$`        |
| `k`        | Move to the end of this word                              | `e`        |
| `W`        | Move cursor five words forward                            | `5w`       |
| `B`        | Move cursor five words forward                            | `5b`       |

##### 1.3 Remapped Text Manipulating Commands in Normal Mode
| Shortcut        | Action                                |
|-----------------|---------------------------------------|
| `u`             | **undo**                              |
| `<`             | Un-indent                             |
| `>`             | Indent                                |

##### 1.4 Other Useful Normal Mode Remappings
| Shortcut        | Action                                         |
|-----------------|------------------------------------------------|
| `F5`             | **Compile/Run the current file**              |

##### 1.5 Remapped Commands in Visual Mode
| Shortcut        | Action                                 |
|-----------------|----------------------------------------|
| `Y`             | Copy selected text to system clipboard |


#### 2 Window Management
##### 2.1 Creating Window Through Split Screen
| Shortcut    | Action                                                                      |
|-------------|-----------------------------------------------------------------------------|
| `s` `e`     | Create a new horizontal split screen and place it above the current window  |
| `s` `n`     | Create a new horizontal split screen and place it below the current window  |
| `s` `h`     | Create a new vertical split screen and place it left to the current window  |
| `s` `i`     | Create a new vertical split screen and place it right to the current window |
| `s` `v`     | Set the two splits to be vertical                                           |
| `s` `h`     | Set the two splits to be horizontal                                         |
| `s` `r` `v` | Rotate splits and arrange splits vertically                                 |
| `s` `r` `h` | Rotate splits and arrange splits horizontally                               |

##### 2.2 Moving the Cursor Between Different Windows
| Shortcut      | Action                         |
|---------------|--------------------------------|
| `SPACE` + `w` | Move cursor to the next window |
| `SPACE` + `h` | Move cursor one window left    |
| `SPACE` + `i` | Move cursor one window right   |
| `SPACE` + `e` | Move cursor one window up      |
| `SPACE` + `n` | Move cursor one window down    |
