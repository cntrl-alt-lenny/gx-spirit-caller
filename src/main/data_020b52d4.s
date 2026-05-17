; Brief 121 Part 2 worked example — cluster C Pattern 2 verification.
;
; Brief 119 sketched Pattern 2 (group adjacent non-aligned .rodata symbols
; into a TU whose total size is 4-aligned) but didn't end-to-end test.
;
; Worked example: data_020b52d4 (2 bytes) + data_020b52d6 (2 bytes) =
; 4-byte chunk at 0x020b52d4-0x020b52d8. Both bytes are zero in orig.
;
; dsd's symbol-size deduction must accept both embedded symbols within
; the TU range. Here the constraint holds naturally:
;   data_020b52d4 deduced size = next_addr (0x020b52d6) - this_addr = 2
;   data_020b52d6 deduced size = next_addr (0x020b52d8) - this_addr = 2
; Both fit in the 4-byte TU range — no dsd validation error.
;
; Compared to brief 119's brief example (NAN(\0 + INFINITY\0) where
; data_020c3881's deduced size (0x10b) exceeded the 16-byte TU range,
; this candidate is dsd-compatible. The lesson: Pattern 2 only works
; when the LAST embedded symbol's deduced size fits within the chunk.

        .section .rodata

        .global data_020b52d4
data_020b52d4:
        .byte 0x00, 0x00

        .global data_020b52d6
data_020b52d6:
        .byte 0x00, 0x00
