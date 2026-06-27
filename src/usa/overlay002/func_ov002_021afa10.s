; func_ov002_021afa10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .global func_ov002_021afa10
        .arm
func_ov002_021afa10:
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r2, [r1, #0x4]
    cmp r2, #0x5
    movle r0, #0x0
    bxle lr
    cmp r2, #0x26
    beq .L_fc0
    sub r1, r2, #0x47
    cmp r1, #0x1
    bhi .L_fcc
.L_fc0:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc]
    bx lr
.L_fcc:
    cmp r2, #0x6
    ble .L_fe0
    cmp r2, #0x26
    sublt r0, r2, #0x6
    blt .L_ff0
.L_fe0:
    cmp r2, #0x27
    ble .L_ff0
    cmp r2, #0x47
    sublt r0, r2, #0x27
.L_ff0:
    ldr r1, _LIT0
    ldr r1, [r1, #0xc]
    cmp r0, r1
    movcs r0, r1
    bx lr
_LIT0: .word data_ov002_022cdb98
