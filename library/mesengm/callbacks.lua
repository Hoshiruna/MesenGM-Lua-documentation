-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Registers a callback for reads, writes, or instruction execution in an address
---range. Read callbacks run after the read. Write callbacks run before the write.
---If the callback returns an integer, that value replaces the result of the
---operation.
---@param callback Mesen.MemoryCallback Function called with the address and value.
---@param callbackType emu.callbackType Operation that invokes the callback.
---@param startAddress integer First address in the range.
---@param endAddress? integer Last address in the range. Defaults to `startAddress`.
---@param cpuType? emu.cpuType CPU to monitor. Defaults to the main CPU.
---@param memoryType? emu.memType Memory space to monitor. Defaults to main CPU memory.
---@return Mesen.CallbackReference reference Pass this value to `emu.removeMemoryCallback`.
function emu.addMemoryCallback(callback, callbackType, startAddress, endAddress, cpuType, memoryType) end

---Removes a memory callback registered with `emu.addMemoryCallback`. The callback
---type, address range, CPU, and memory space must match the original registration.
---@param reference Mesen.CallbackReference
---@param callbackType emu.callbackType
---@param startAddress integer
---@param endAddress? integer Defaults to `startAddress`.
---@param cpuType? emu.cpuType Defaults to the main CPU.
---@param memoryType? emu.memType Defaults to main CPU memory.
function emu.removeMemoryCallback(reference, callbackType, startAddress, endAddress, cpuType, memoryType) end

---Registers a callback for an emulator event. The callback receives the CPU that
---triggered the event, which distinguishes events from different CPUs in systems
---such as Super Game Boy.
---@param callback Mesen.EventCallback
---@param eventType emu.eventType
---@return Mesen.CallbackReference reference Pass this value to `emu.removeEventCallback`.
function emu.addEventCallback(callback, eventType) end

---Removes an event callback registered with `emu.addEventCallback`.
---@param reference Mesen.CallbackReference
---@param eventType emu.eventType
function emu.removeEventCallback(reference, eventType) end
