-- SPDX-License-Identifier: GPL-3.0-or-later
---@meta

---Selects the surface used by subsequent drawing calls.
---
---The console screen has a fixed resolution, and its drawings appear in
---screenshots and videos. The script HUD is independent of the console output,
---has a configurable scale, and does not appear in screenshots or videos.
---`emu.setScreenBuffer` always targets the console screen.
---@param surface emu.drawSurface
---@param scale? integer Scale for the script HUD, from 1 to 4. Defaults to the current scale.
function emu.selectDrawSurface(surface, scale) end

---Returns the full size, visible size, and overscan for a draw surface.
---@param surface? emu.drawSurface Defaults to the current draw surface.
---@return Mesen.DrawSurfaceSize
function emu.getDrawSurfaceSize(surface) end

---Returns the dimensions of the console's current screen output.
---@return Mesen.Size
function emu.getScreenSize() end

---Draws a line from `(x, y)` to `(x2, y2)`.
---@param x integer
---@param y integer
---@param x2 integer
---@param y2 integer
---@param color? Mesen.Color Defaults to opaque white (`0xFFFFFF`).
---@param duration? integer Number of frames to display. Defaults to 1.
---@param delay? integer Number of frames to wait before drawing. Defaults to 0.
function emu.drawLine(x, y, x2, y2, color, duration, delay) end

---Draws a pixel at `(x, y)`.
---@param x integer
---@param y integer
---@param color Mesen.Color
---@param duration? integer Number of frames to display. Defaults to 1.
---@param delay? integer Number of frames to wait before drawing. Defaults to 0.
function emu.drawPixel(x, y, color, duration, delay) end

---Draws a rectangular block of pixels at `(x, y)`. Pixels are read from index 1
---in row-major order.
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param pixelData Mesen.PixelBuffer
---@param duration? integer Number of frames to display. Defaults to 1.
---@param delay? integer Number of frames to wait before drawing. Defaults to 0.
function emu.drawPixels(x, y, width, height, pixelData, duration, delay) end

---Draws a rectangle at `(x, y)`.
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param color? Mesen.Color Defaults to opaque white (`0xFFFFFF`).
---@param fill? boolean Draws a filled rectangle when true. Defaults to false.
---@param duration? integer Number of frames to display. Defaults to 1.
---@param delay? integer Number of frames to wait before drawing. Defaults to 0.
function emu.drawRectangle(x, y, width, height, color, fill, duration, delay) end

---Draws text at `(x, y)`.
---@param x integer
---@param y integer
---@param text string
---@param textColor? Mesen.Color Defaults to opaque white (`0xFFFFFF`).
---@param backgroundColor? Mesen.Color Defaults to opaque black (`0x000000`).
---@param maxWidth? integer Wrap width in pixels. A value of 0 disables wrapping.
---@param duration? integer Number of frames to display. Defaults to 1.
---@param delay? integer Number of frames to wait before drawing. Defaults to 0.
---@param fontId? Mesen.FontId Font returned by `emu.loadFont`. Defaults to the built-in font.
function emu.drawString(x, y, text, textColor, backgroundColor, maxWidth, duration, delay, fontId) end

---Measures text using the same wrapping and font rules as `emu.drawString`.
---@param text string
---@param maxWidth? integer Wrap width in pixels. A value of 0 disables wrapping.
---@param fontId? Mesen.FontId Font returned by `emu.loadFont`. Defaults to the built-in font.
---@return Mesen.Size
function emu.measureString(text, maxWidth, fontId) end

--- MesenGM only
---Loads a TrueType font. Relative paths are resolved from the Lua script's
---folder. I/O access must be enabled in the script window.
---@param filename string Path to a TTF or TTC font file.
---@param pixelSize integer Font size in pixels, from 1 to 256.
---@param monochrome? boolean Use only fully opaque or fully transparent glyph pixels.
---@param faceIndex? integer Font face in a TrueType collection. Defaults to 0.
---@return Mesen.FontId fontId
function emu.loadFont(filename, pixelSize, monochrome, faceIndex) end

---Unloads a font returned by `emu.loadFont`. Text already queued for drawing keeps
---its font.
---@param fontId Mesen.FontId
function emu.unloadFont(fontId) end

---Removes all shapes and text from both drawing surfaces.
function emu.clearScreen() end

---Returns the rendered console screen as a one-dimensional, 1-based ARGB buffer.
---The dimensions can vary by console, game, and scene. Use `emu.getScreenSize` to
---obtain the current width and height.
---@return Mesen.PixelBuffer
function emu.getScreenBuffer() end

---Replaces the current console frame with a 1-based ARGB pixel buffer.
---@param screenBuffer Mesen.PixelBuffer
function emu.setScreenBuffer(screenBuffer) end

---Returns the rendered console color at `(x, y)`.
---@param x integer
---@param y integer
---@return Mesen.Color color
function emu.getPixel(x, y) end
