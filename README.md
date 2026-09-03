# MesenGM Lua API definitions

LuaLS/LuaCATS definitions for the Lua API exposed by MesenGM's script window.
They provide completion, parameter information, enum values, callback signatures,
and return types without adding runtime code to a script.

The definitions are based on [MesenGM](https://github.com/Hoshiruna/MesenGM)'s bundled
`UI/Debugger/Documentation/LuaDocumentation.json` reference and checked against
`Core/Debugger/LuaApi.cpp`. The current snapshot matches MesenGM commit
[`b9eedf9`](https://github.com/Hoshiruna/MesenGM/tree/b9eedf916b9006d08ceeb9facb6f5aabc9fe31e6).

## Use with Lua Language Server

Add this repository's `library` directory to the Lua Language Server workspace
library. For Visual Studio Code with the Lua extension, place this in your user
or workspace settings and replace the path with your local checkout:

```json
{
  "Lua.runtime.version": "Lua 5.4",
  "Lua.workspace.library": [
    "your path"
  ]
}
```

The included `.luarc.json` applies the same settings when a script is opened as
part of this repository.

Do not `require` these files from a MesenGM script. They are editor metadata and
are marked with `---@meta` for that purpose.

## Scope

The library covers the global `emu` table, including:

- callbacks and callback references;
- drawing surfaces, colors, fonts, and screen buffers;
- emulator control and state access;
- controller, keyboard, and mouse input;
- logging, memory access, cheats, access counters, CDL data, and savestates;
- all enum values exposed by the current binding implementation.

State and controller tables vary by console or attached device. Their definitions
therefore use typed map aliases instead of claiming fields that are not common to
every system.

## License

These definitions are derived from MesenGM, which is licensed under the GNU
General Public License version 3 or later. This repository uses the same license.
See [LICENSE.md](LICENSE.md).
