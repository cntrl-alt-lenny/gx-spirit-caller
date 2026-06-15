; func_02021c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02197434
        .extern data_02198434
        .global func_02021c30
        .arm
func_02021c30:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r5, [r1, #0xb0]
    ldr r1, _LIT1
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_44
    mov r2, r1
.L_24:
    add r0, r2, #0x1000
    ldr r0, [r0, #0x48]
    cmp r0, #0x0
    beq .L_44
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0x68
    blt .L_24
.L_44:
    cmp r3, r5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    mov r2, #0x68
    mul r5, r3, r2
    add r0, r1, #0x48
    add r6, r0, #0x1000
    add r7, r6, r5
    mov r1, r7
    mov r0, #0x0
    bl Fill32
    str r4, [r6, r5]
    mov r1, #0x0
    mov r0, r7
    str r1, [r7, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02198434
_LIT1: .word data_02197434
