-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Returns the size of a memory space in bytes.
---@param memoryType emu.memType
---@return integer size
function emu.getMemorySize(memoryType) end

---Reads an 8-bit value. CPU memory types can trigger read side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param memoryType emu.memType
---@param signed? boolean Return a signed 8-bit value when true. Defaults to false.
---@return integer value
function emu.read(address, memoryType, signed) end

---Reads a 16-bit value. CPU memory types can trigger read side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param memoryType emu.memType
---@param signed? boolean Return a signed 16-bit value when true. Defaults to false.
---@return integer value
function emu.read16(address, memoryType, signed) end

---Reads a 32-bit value. CPU memory types can trigger read side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param memoryType emu.memType
---@param signed? boolean Return a signed 32-bit value when true. Defaults to false.
---@return integer value
function emu.read32(address, memoryType, signed) end

---Writes an 8-bit value. CPU memory types can trigger write side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param value integer
---@param memoryType emu.memType
function emu.write(address, value, memoryType) end

---Writes a 16-bit value. CPU memory types can trigger write side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param value integer
---@param memoryType emu.memType
function emu.write16(address, value, memoryType) end

---Writes a 32-bit value. CPU memory types can trigger write side effects. Use the
---corresponding `*Debug` memory type to suppress them.
---@param address integer
---@param value integer
---@param memoryType emu.memType
function emu.write32(address, value, memoryType) end

---Compatibility alias for `emu.read16`.
---@deprecated Use `emu.read16`.
---@param address integer
---@param memoryType emu.memType
---@param signed? boolean Return a signed 16-bit value when true. Defaults to false.
---@return integer value
function emu.readWord(address, memoryType, signed) end

---Compatibility alias for `emu.write16`.
---@deprecated Use `emu.write16`.
---@param address integer
---@param value integer
---@param memoryType emu.memType
function emu.writeWord(address, value, memoryType) end

---Converts between a CPU address and an address in a ROM or RAM memory space.
---Returns nil when the address has no mapping in the requested direction.
---@param address integer
---@param memoryType? emu.memType Defaults to main CPU memory.
---@param cpuType? emu.cpuType Defaults to the main CPU.
---@return Mesen.AddressInfo? result
function emu.convertAddress(address, memoryType, cpuType) end

---Returns the address and memory space associated with a debugger label.
---@param label string
---@return Mesen.AddressInfo? result Nil when the label does not exist.
function emu.getLabelAddress(label) end
