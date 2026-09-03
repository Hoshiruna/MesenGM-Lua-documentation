-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---The global API table provided by MesenGM's script window.
---@class emu
emu = {}

---An ARGB color. The alpha byte is inverted: `0` is opaque and `255` is fully
---transparent. For example, `0xFFFFFF` is opaque white and `0x7F000000` is
---semi-transparent black.
---@alias Mesen.Color integer

---A font identifier returned by `emu.loadFont`. A value of `0` selects Mesen's
---built-in font.
---@alias Mesen.FontId integer

---A callback identifier returned by `emu.addEventCallback` or
---`emu.addMemoryCallback`.
---@alias Mesen.CallbackReference integer

---A callback invoked for a memory read, write, or instruction execution.
---Returning an integer replaces the value used by the memory operation.
---@alias Mesen.MemoryCallback fun(address: integer, value: integer): integer?

---A callback invoked when an emulator event occurs.
---@alias Mesen.EventCallback fun(cpuType: emu.cpuType)

---@class Mesen.AddressInfo
---@field address integer Address in the returned memory space.
---@field memType emu.memType Memory space containing `address`.

---@class Mesen.Size
---@field width integer
---@field height integer

---@class Mesen.Overscan
---@field top integer
---@field bottom integer
---@field left integer
---@field right integer

---@class Mesen.DrawSurfaceSize: Mesen.Size
---@field visibleWidth integer Width without overscan.
---@field visibleHeight integer Height without overscan.
---@field overscan Mesen.Overscan

---@class Mesen.MouseState
---@field x integer
---@field y integer
---@field relativeX number
---@field relativeY number
---@field left boolean
---@field middle boolean
---@field right boolean

---@class Mesen.RomInfo
---@field name string ROM filename.
---@field path string Full ROM path.
---@field fileSha1Hash string SHA-1 hash of the loaded ROM.

---A controller state. Field names depend on the connected device. Digital
---buttons use booleans, while coordinates and other analog values use integers.
---@alias Mesen.InputState table<string, boolean|integer>

---A console or CPU state table. Field names depend on the active system and may
---change between MesenGM versions.
---@alias Mesen.State table<string, boolean|integer|number|string>

---A one-dimensional buffer of ARGB colors.
---@alias Mesen.PixelBuffer Mesen.Color[]
