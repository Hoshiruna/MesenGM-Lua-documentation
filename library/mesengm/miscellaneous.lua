-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Adds a temporary cheat. Cheats added by a script are not saved or shown in the
---user interface.
---@param cheatType emu.cheatType
---@param cheatCode string
function emu.addCheat(cheatType, cheatCode) end

---Disables all active cheats, including cheats configured in the user interface.
---Saved cheat settings are not deleted.
function emu.clearCheats() end

---Returns one counter value for every byte in the selected memory space. The
---returned table is indexed from 0 to `emu.getMemorySize(memoryType) - 1`.
---@param memoryType emu.memType
---@param counterType emu.counterType
---@return table<integer, integer> counters
function emu.getAccessCounters(memoryType, counterType) end

---Resets all memory access counters.
function emu.resetAccessCounters() end

---Returns code/data logger bytes for a supported ROM memory space. The returned
---table is indexed from 0 to `emu.getMemorySize(memoryType) - 1`.
---@param memoryType emu.memType
---@return table<integer, integer> data
function emu.getCdlData(memoryType) end

---Creates a savestate in memory. This function is available only inside an
---`exec` memory callback for the main CPU.
---@return string state Binary savestate data.
function emu.createSavestate() end

---Loads an in-memory savestate. This function is available only inside an `exec`
---memory callback for the main CPU.
---@param state string Binary data returned by `emu.createSavestate`.
---@return boolean loaded Whether MesenGM loaded the state successfully.
function emu.loadSavestate(state) end

---Takes a screenshot without writing it to disk.
---@return string png Binary PNG data.
function emu.takeScreenshot() end

---Returns information about the loaded ROM.
---@return Mesen.RomInfo
function emu.getRomInfo() end

---Returns a script-specific directory inside MesenGM's `LuaScriptData` folder.
---Returns an empty string when I/O access is disabled.
---@return string path
function emu.getScriptDataFolder() end
