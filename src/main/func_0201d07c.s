; func_0201d07c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0218febc
        .extern data_0218ff8c
        .global func_0201d07c
        .arm
func_0201d07c:
    ldr r0, .L_0201d0a8
    mov r1, #0x3
    str r1, [r0, #0x14]
    mov r2, #0x0
    ldr r0, .L_0201d0ac
    mov r1, r2
.L_0201d094:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x20
    blt .L_0201d094
    bx lr
.L_0201d0a8:
        .word   data_0218febc
.L_0201d0ac:
        .word   data_0218ff8c
