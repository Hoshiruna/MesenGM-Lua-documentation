-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Memory callback operation.
---@enum emu.callbackType
emu.callbackType = {
    ---Called after data is read.
    read = 0,
    ---Called before data is written.
    write = 1,
    ---Called when the CPU starts executing an instruction.
    exec = 2,
}

---Cheat code format.
---@enum emu.cheatType
emu.cheatType = {
    ---Game Genie code for NES.
    nesGameGenie = 0,
    ---Pro Action Rocky code for NES.
    nesProActionRocky = 1,
    ---Custom address and value code for NES.
    nesCustom = 2,
    ---Game Genie code for Game Boy.
    gbGameGenie = 3,
    ---GameShark code for Game Boy.
    gbGameShark = 4,
    ---Game Genie code for SNES.
    snesGameGenie = 5,
    ---Pro Action Replay code for SNES.
    snesProActionReplay = 6,
    ---Raw 24-bit address code for PC Engine.
    pceRaw = 7,
    ---21-bit address code for PC Engine.
    pceAddress = 8,
    ---Pro Action Replay code for Master System.
    smsProActionReplay = 9,
    ---Game Genie code for Master System.
    smsGameGenie = 10,
}

---Memory access counter value to retrieve.
---@enum emu.counterType
emu.counterType = {
    ---Number of reads for each byte.
    readCount = 0,
    ---Number of writes for each byte.
    writeCount = 1,
    ---Number of instruction executions for each byte.
    execCount = 2,
    ---Master clock when each byte was last read.
    lastReadClock = 3,
    ---Master clock when each byte was last written.
    lastWriteClock = 4,
    ---Master clock when each byte was last executed.
    lastExecClock = 5,
}

---CPU identifier.
---@enum emu.cpuType
emu.cpuType = {
    ---SNES main CPU, S-CPU 5A22 (65816).
    snes = 0,
    ---SNES SPC.
    spc = 1,
    ---SNES DSP-n.
    necDsp = 2,
    ---SNES SA-1.
    sa1 = 3,
    ---SNES GSU.
    gsu = 4,
    ---SNES CX4.
    cx4 = 5,
    ---SNES ST018.
    st018 = 6,
    ---Game Boy main CPU. This also applies in Super Game Boy mode.
    gameboy = 7,
    ---NES main CPU, 2A03 (6502).
    nes = 8,
    ---PC Engine main CPU, HuC6280.
    pce = 9,
    ---Master System main CPU, Z80.
    sms = 10,
    ---Game Boy Advance main CPU, ARM7TDMI.
    gba = 11,
    ---WonderSwan main CPU, NEC V30MZ.
    ws = 12,
}

---Surface used by subsequent drawing calls.
---@enum emu.drawSurface
emu.drawSurface = {
    ---The console framebuffer. Drawings appear in screenshots and videos.
    consoleScreen = 0,
    ---A separate configurable surface. Drawings do not appear in screenshots or videos.
    scriptHud = 1,
}

---Emulator event that can invoke a callback.
---@enum emu.eventType
emu.eventType = {
    ---An NMI occurred. This event is unavailable on some consoles.
    nmi = 0,
    ---An IRQ occurred.
    irq = 1,
    ---A frame started, typically when vertical blank ends.
    startFrame = 2,
    ---A frame ended, typically when vertical blank starts.
    endFrame = 3,
    ---The console was reset. This event is unavailable on some consoles.
    reset = 4,
    ---The Lua script stopped.
    scriptEnded = 5,
    ---The emulator updated all input devices. This occurs once per frame.
    inputPolled = 6,
    ---A savestate was loaded manually.
    stateLoaded = 7,
    ---A savestate was saved manually.
    stateSaved = 8,
    ---Code execution stopped because of a breakpoint, step, or similar event.
    codeBreak = 9,
    ---Execution entered a halted state. This value is exposed by MesenGM but is
    ---not described by the bundled Lua reference.
    haltStarted = 10,
    ---Execution left a halted state. This value is exposed by MesenGM but is not
    ---described by the bundled Lua reference.
    haltEnded = 11,
}

---Debugger step operation.
---@enum emu.stepType
emu.stepType = {
    ---Step the specified number of instructions.
    step = 0,
    ---Step out of the current subroutine. This is unavailable for some CPUs.
    stepOut = 1,
    ---Step over the current subroutine call. This is unavailable for some CPUs.
    stepOver = 2,
    ---Step the specified number of CPU cycles. This is unavailable for some CPUs.
    cpuCycleStep = 3,
    ---Step the specified number of scanline cycles.
    ppuStep = 4,
    ---Step the specified number of scanlines.
    ppuScanline = 5,
    ---Step the specified number of video frames.
    ppuFrame = 6,
    ---Stop on the specified scanline.
    specificScanline = 7,
    ---Stop on the next NMI event.
    runToNmi = 8,
    ---Stop on the next IRQ event.
    runToIrq = 9,
}

---Memory space identifier. Debug variants suppress read and write side effects.
---@enum emu.memType
emu.memType = {
    ---SNES S-CPU memory.
    snesMemory = 0,
    ---SNES SPC memory.
    spcMemory = 1,
    ---SNES SA-1 memory.
    sa1Memory = 2,
    ---SNES DSP-n memory.
    necDspMemory = 3,
    ---SNES GSU memory.
    gsuMemory = 4,
    ---SNES CX4 memory.
    cx4Memory = 5,
    ---SNES ST018 memory.
    st018Memory = 6,
    ---Game Boy CPU memory.
    gameboyMemory = 7,
    ---NES CPU memory.
    nesMemory = 8,
    ---NES PPU memory.
    nesPpuMemory = 9,
    ---PC Engine CPU memory.
    pceMemory = 10,
    ---Master System CPU memory.
    smsMemory = 11,
    ---Game Boy Advance CPU memory.
    gbaMemory = 12,
    ---WonderSwan CPU memory.
    wsMemory = 13,

    ---SNES S-CPU memory without read or write side effects.
    snesDebug = 0x100,
    ---SNES SPC memory without read or write side effects.
    spcDebug = 0x101,
    ---SNES SA-1 memory without read or write side effects.
    sa1Debug = 0x102,
    ---SNES DSP-n memory without read or write side effects.
    necDspDebug = 0x103,
    ---SNES GSU memory without read or write side effects.
    gsuDebug = 0x104,
    ---SNES CX4 memory without read or write side effects.
    cx4Debug = 0x105,
    ---SNES ST018 memory without read or write side effects.
    st018Debug = 0x106,
    ---Game Boy CPU memory without read or write side effects.
    gameboyDebug = 0x107,
    ---NES CPU memory without read or write side effects.
    nesDebug = 0x108,
    ---NES PPU memory without read or write side effects.
    nesPpuDebug = 0x109,
    ---PC Engine CPU memory without read or write side effects.
    pceDebug = 0x10A,
    ---Master System CPU memory without read or write side effects.
    smsDebug = 0x10B,
    ---Game Boy Advance CPU memory without read or write side effects.
    gbaDebug = 0x10C,
    ---WonderSwan CPU memory without read or write side effects.
    wsDebug = 0x10D,

    ---SNES program ROM.
    snesPrgRom = 14,
    ---SNES work RAM.
    snesWorkRam = 15,
    ---SNES save RAM.
    snesSaveRam = 16,
    ---SNES video RAM.
    snesVideoRam = 17,
    ---SNES sprite RAM (OAM).
    snesSpriteRam = 18,
    ---SNES palette RAM (CGRAM).
    snesCgRam = 19,
    ---Exposed by MesenGM but not described by the bundled Lua reference.
    snesRegister = 20,
    ---SNES SPC RAM.
    spcRam = 21,
    ---SNES SPC IPL ROM.
    spcRom = 22,
    ---Exposed by MesenGM but not described by the bundled Lua reference.
    spcDspRegisters = 23,
    ---SNES DSP-n program ROM.
    dspProgramRom = 24,
    ---SNES DSP-n data ROM.
    dspDataRom = 25,
    ---SNES DSP-n data RAM.
    dspDataRam = 26,
    ---SNES SA-1 internal RAM.
    sa1InternalRam = 27,
    ---SNES GSU work RAM.
    gsuWorkRam = 28,
    ---SNES CX4 data RAM.
    cx4DataRam = 29,
    ---SNES BS-X PSRAM.
    bsxPsRam = 30,
    ---SNES BS-X memory pack.
    bsxMemoryPack = 31,
    ---SNES ST018 program ROM.
    st018PrgRom = 32,
    ---SNES ST018 data ROM.
    st018DataRom = 33,
    ---SNES ST018 work RAM.
    st018WorkRam = 34,
    ---SNES Sufami Turbo firmware ROM.
    sufamiTurboFirmware = 35,
    ---SNES Sufami Turbo slot B ROM.
    sufamiTurboSecondCart = 36,
    ---SNES Sufami Turbo slot B RAM.
    sufamiTurboSecondCartRam = 37,

    ---Game Boy program ROM.
    gbPrgRom = 38,
    ---Game Boy work RAM.
    gbWorkRam = 39,
    ---Game Boy cartridge or save RAM.
    gbCartRam = 40,
    ---Game Boy high RAM.
    gbHighRam = 41,
    ---Game Boy boot ROM.
    gbBootRom = 42,
    ---Game Boy video RAM.
    gbVideoRam = 43,
    ---Game Boy sprite RAM.
    gbSpriteRam = 44,
    ---Exposed by MesenGM but not described by the bundled Lua reference.
    gbBgPaletteRam = 45,
    ---Exposed by MesenGM but not described by the bundled Lua reference.
    gbObjPaletteRam = 46,

    ---NES program ROM.
    nesPrgRom = 47,
    ---NES internal system RAM.
    nesInternalRam = 48,
    ---NES work RAM.
    nesWorkRam = 49,
    ---NES save RAM.
    nesSaveRam = 50,
    ---NES nametable RAM (CIRAM).
    nesNametableRam = 51,
    ---NES mapper RAM (EXRAM).
    nesMapperRam = 52,
    ---NES sprite RAM (OAM).
    nesSpriteRam = 53,
    ---NES secondary sprite RAM.
    nesSecondarySpriteRam = 54,
    ---NES palette RAM.
    nesPaletteRam = 55,
    ---NES CHR RAM.
    nesChrRam = 56,
    ---NES CHR ROM.
    nesChrRom = 57,

    ---PC Engine HuCard ROM.
    pcePrgRom = 58,
    ---PC Engine work RAM.
    pceWorkRam = 59,
    ---PC Engine save RAM.
    pceSaveRam = 60,
    ---PC Engine CD-ROM unit RAM.
    pceCdromRam = 61,
    ---PC Engine card RAM.
    pceCardRam = 62,
    ---PC Engine ADPCM RAM.
    pceAdpcmRam = 63,
    ---PC Engine Arcade Card RAM.
    pceArcadeCardRam = 64,
    ---PC Engine VDC video RAM.
    pceVideoRam = 65,
    ---PC Engine VDC2 video RAM for SuperGrafx.
    pceVideoRamVdc2 = 66,
    ---PC Engine VDC sprite RAM.
    pceSpriteRam = 67,
    ---PC Engine VDC2 sprite RAM for SuperGrafx.
    pceSpriteRamVdc2 = 68,
    ---PC Engine VCE palette RAM.
    pcePaletteRam = 69,

    ---Master System ROM.
    smsPrgRom = 70,
    ---Master System system RAM.
    smsWorkRam = 71,
    ---Master System cartridge RAM.
    smsCartRam = 72,
    ---Master System BIOS ROM.
    smsBootRom = 73,
    ---Master System video RAM.
    smsVideoRam = 74,
    ---Master System palette RAM.
    smsPaletteRam = 75,
    ---Master System I/O port.
    smsPort = 76,

    ---Game Boy Advance ROM.
    gbaPrgRom = 77,
    ---Game Boy Advance BIOS ROM.
    gbaBootRom = 78,
    ---Game Boy Advance save RAM, flash, or EEPROM.
    gbaSaveRam = 79,
    ---Game Boy Advance internal work RAM.
    gbaIntWorkRam = 80,
    ---Game Boy Advance external work RAM.
    gbaExtWorkRam = 81,
    ---Game Boy Advance video RAM.
    gbaVideoRam = 82,
    ---Game Boy Advance sprite RAM.
    gbaSpriteRam = 83,
    ---Game Boy Advance palette RAM.
    gbaPaletteRam = 84,

    ---WonderSwan ROM.
    wsPrgRom = 85,
    ---WonderSwan work RAM.
    wsWorkRam = 86,
    ---WonderSwan save RAM.
    wsCartRam = 87,
    ---WonderSwan cartridge EEPROM.
    wsCartEeprom = 88,
    ---WonderSwan boot ROM.
    wsBootRom = 89,
    ---WonderSwan internal EEPROM.
    wsInternalEeprom = 90,
    ---WonderSwan I/O port.
    wsPort = 91,
    ---No memory space. This value is exposed by MesenGM but is not described by
    ---the bundled Lua reference.
    none = 92,
}
