-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Writes a value to the script window's log. Tables are serialized as key-value
---pairs.
---@param data any
function emu.log(data) end

---Displays `[category] text` in the main emulator window.
---@param category string Text shown between brackets.
---@param text string Message to display.
function emu.displayMessage(category, text) end

---Returns the text currently shown in the emulator's log window.
---@return string log
function emu.getLogWindowLog() end
