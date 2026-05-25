; func_0207deb0: 4-field struct init — stash data_020beea4 ptr in
; slot 0 of the struct, args a/b in slots 1/2, zero in slot 3. The
; C version (assigning &data_020beea4 to a pointer field) compiles to
; a longer sequence with mwcc 2.0 — ship as `.s`.

        .text
        .extern data_020beea4
        .global func_0207deb0
        .arm
func_0207deb0:
        ldr     ip, .L_0207decc
        mov     r3, #0x0
        str     ip, [r0, #0x0]
        str     r1, [r0, #0x4]
        str     r2, [r0, #0x8]
        str     r3, [r0, #0xc]
        bx      lr
.L_0207decc:
        .word   data_020beea4
