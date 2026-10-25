# Bobby Bearing – repaired Plus/4 conversion

**Version:** 1.0  
**Development:** 2023  
**Platform:** Commodore Plus/4  
**Language:** 6502 assembly  
**Assembler:** KickAssembler  
**Status:** Completed and tested; archived for preservation

## About

*Bobby Bearing* originated on the ZX Spectrum and was also released on the Commodore 64. **Ceekay** created the Commodore Plus/4 conversion, but serious bugs prevented players from completing the game.

**Chronos / Absence and Csabo** jointly reverse-engineered and fixed the conversion, restoring its playability. Several graphical tiles were also incorrect; **Csabo** extracted the original graphics from the ZX Spectrum version to replace them.

## Credits

- Original game: *Bobby Bearing*
- Original Plus/4 conversion: **Ceekay**
- Reverse engineering and bug fixes: **Chronos / Absence and Csabo**
- Original ZX Spectrum graphics extraction: **Csabo**

## Source files

- `bobbyfix_g6900.asm` — repaired game source
- `gfx_fixed.asm` — original Spectrum graphics extracted by Csabo to correct tiles

**Note:** This project contains third-party game code and graphics. Their rights are not transferred by this archive. The game has no music.

## Building

The sources have been converted to **KickAssembler**. Earlier references to DASM, as65 or Plus4IDE describe historical development tools, not current build requirements. The original source files are preserved without modification.

## Acknowledgements

**Thanks to Csabo and Siz.**

## Rights and reuse

This repository is provided for historical preservation and study. Original contributions authored solely by Chronos / Absence may be reused under the MIT License, but this permission does **not** extend to third-party music, game code, graphics, players, or contributions by other authors. Such materials remain subject to their respective owners' rights. No blanket license for the entire repository is implied.
