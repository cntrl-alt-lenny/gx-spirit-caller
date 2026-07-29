/* data_ov004_02209fd0 (64 bytes, 4-aligned): wave 13 investigation --
 * CORRECTLY OPAQUE, kept unchanged (comment-only fix; the prior header's
 * "shape=struct" tag was a mechanical batch-carve label, not a real
 * shape claim -- disregarded per this campaign's standing rule).
 * Content is genuine text: ASCII "Wi-Fi" followed by a Shift-JIS
 * Japanese sentence (0x81/0x82/0x83-lead-byte sequences are standard
 * Shift-JIS, decoding to a Wi-Fi connection-status message), then two
 * more Shift-JIS "0034d-"-style fragments and a trailing NUL pair.
 * Kept as a plain byte array rather than a `char[] = "..."` string
 * literal: embedding raw Shift-JIS bytes inside a quoted literal in
 * this source tree risks silent mis-transcoding by editors/git/the
 * mwcc source-charset assumption, for zero byte-layout benefit over
 * the existing hex form. No relocation or consumer references this
 * symbol at all (grep across src/ and libs/, all regions: none) --
 * genuinely unreferenced text, not merely an unread field.
 */

unsigned char data_ov004_02209fd0[64] = {
    0x57, 0x69, 0x2d, 0x46, 0x69, 0x83, 0x52, 0x83, 0x6c, 0x83, 0x4e, 0x83,
    0x56, 0x83, 0x87, 0x83, 0x93, 0x82, 0xc9, 0x90, 0xda, 0x91, 0xb1, 0x82,
    0xb5, 0x82, 0xdc, 0x82, 0xb5, 0x82, 0xbd, 0x81, 0x42, 0x0a, 0x97, 0x46,
    0x92, 0x42, 0x83, 0x52, 0x81, 0x5b, 0x83, 0x68, 0x81, 0x46, 0x25, 0x30,
    0x34, 0x64, 0x2d, 0x25, 0x30, 0x34, 0x64, 0x2d, 0x25, 0x30, 0x34, 0x64,
    0x0a, 0x0a, 0x00, 0x00,
};
