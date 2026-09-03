-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Returns the console's current state. Field names and contents depend on the
---active console and game, and may change between MesenGM versions.
---@return Mesen.State
function emu.getState() end

---Applies values from a console state table. Some fields describe internal state
---and should not be changed.
---@param state Mesen.State
function emu.setState(state) end

---Returns the current state of a CPU. Field names and contents depend on the CPU
---and may change between MesenGM versions.
---@param cpuType? emu.cpuType Defaults to the main CPU.
---@return Mesen.State
function emu.getCpuState(cpuType) end

---Applies values from a CPU state table. Some fields describe internal state and
---should not be changed.
---@param state Mesen.State
---@param cpuType? emu.cpuType Defaults to the main CPU.
function emu.setCpuState(state, cpuType) end

---Returns the number of CPU cycles elapsed since power-on or reset.
---@param cpuType? emu.cpuType Defaults to the main CPU.
---@return integer cycles
function emu.getCpuCycleCount(cpuType) end

---Returns the number of console master clock cycles elapsed since power-on or
---reset.
---@return integer cycles
function emu.getMasterClock() end

---Resets the current game. On consoles without a reset button, this has the same
---effect as a power cycle. This function must be called from a callback.
function emu.reset() end

---Stops emulation. When MesenGM runs with `--testRunner`, the process returns the
---given exit code.
---@param exitCode? integer Defaults to 0.
function emu.stop(exitCode) end

---Breaks execution. This function must be called from a callback.
function emu.breakExecution() end

---Resumes execution after a break. This function must be called from a callback.
function emu.resume() end

---Continues execution until the requested step condition is met. This function
---must be called from a callback.
---@param count integer Number of instructions, cycles, scanlines, or frames.
---@param stepType emu.stepType
---@param cpuType? emu.cpuType Defaults to the main CPU.
function emu.step(count, stepType, cpuType) end

---Rewinds emulation immediately. This function is available only inside an
---`exec` memory callback for the main CPU.
---@param seconds integer Number of seconds to rewind. Must be at least 1.
function emu.rewind(seconds) end
