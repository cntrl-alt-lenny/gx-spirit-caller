; func_02021ae4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02103fcc
        .extern data_02197354
        .extern data_02198354
        .global func_02021ae4
        .arm
func_02021ae4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, _LIT2
    ldr r2, _LIT3
    ldr r0, [r0, #0x38]
    str r5, [r2, #0xb0]
    mov r0, r0, lsl #0x10
    ldr r1, _LIT4
    mov r0, r0, lsr #0x10
    str r0, [r1, #0x4]
    mov r2, #0x0
    mvn r1, #0x0
.L_44:
    add r0, r4, r2, lsl #0x4
    add r2, r2, #0x1
    str r1, [r0, #0x48]
    cmp r2, #0x100
    blt .L_44
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02197354
_LIT1: .word 0x000034a8
_LIT2: .word data_02103fcc
_LIT3: .word data_02198354
_LIT4: .word data_02197354
