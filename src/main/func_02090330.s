; func_02090330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
;
; _LIT1/_LIT2 reference data_020c3198+2 / +4 rather than independent
; data_020c319a / data_020c319c externs (cm-data-020c3198-carve):
; the 3 addresses are 3 fields of ONE 6-byte record in a table now
; unified into one typed struct array at data_020c3198 — the +2/+4
; forms are the same final relocation target, verified via objdump.

        .text
        .extern data_020c3198
        .extern data_021a633c
        .extern data_021a6348
        .extern data_021a634c
        .extern data_021a6350
        .extern func_0208cee8
        .global func_02090330
        .arm
func_02090330:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0208cee8
    mov r1, #0x6
    mul ip, r0, r1
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldrh r5, [r3, ip]
    ldrh r4, [r2, ip]
    ldrh lr, [r1, ip]
    ldr ip, _LIT3
    ldr r3, _LIT4
    mov r5, r5, lsl #0xc
    ldr r2, _LIT5
    mov r4, r4, lsl #0xc
    ldr r1, _LIT6
    mov lr, lr, lsl #0xc
    str r0, [ip]
    str r5, [r3]
    str r4, [r2]
    str lr, [r1]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_020c3198
_LIT1: .word data_020c3198+2
_LIT2: .word data_020c3198+4
_LIT3: .word data_021a6348
_LIT4: .word data_021a633c
_LIT5: .word data_021a634c
_LIT6: .word data_021a6350
