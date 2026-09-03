-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Returns whether a keyboard key or controller button is pressed. `keyName` must
---match the name shown by MesenGM's input binding interface.
---@param keyName string
---@return boolean pressed
function emu.isKeyPressed(keyName) end

---Returns the names of all keyboard keys and controller buttons currently held.
---@return string[] keys
function emu.getPressedKeys() end

---Returns the current mouse position and button state.
---@return Mesen.MouseState
function emu.getMouseState() end

---Returns the state of every control on a controller. Field names depend on the
---controller connected to the selected port.
---@param port integer Port number.
---@param subPort? integer Subport for a multitap-style adapter. Defaults to 0.
---@return Mesen.InputState
function emu.getInput(port, subPort) end

---Sets controller values until the next `inputPolled` event. Fields omitted from
---`input` remain under player control. Calling this from an `inputPolled` callback
---ensures that the values are applied before the game reads them.
---@param input Mesen.InputState Same format as the value returned by `emu.getInput`.
---@param port integer Port number.
---@param subPort? integer Subport for a multitap-style adapter. Defaults to 0.
function emu.setInput(input, port, subPort) end
