; func_ov002_021aff90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern func_ov002_021aff4c
        .extern func_ov002_021aff78
        .global func_ov002_021aff90
        .arm
func_ov002_021aff90:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    mov r7, r0
    ldr r0, [r4, #0xc]
    mov r6, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
    mov r5, r6
.L_20:
    mov r0, r6
    bl func_ov002_021aff78
    mov r1, r0
    cmp r1, r7
    bne .L_44
    mov r0, r6
    mov r1, r5
    bl func_ov002_021aff4c
    b .L_54
.L_44:
    ble .L_54
    mov r0, r6
    sub r1, r1, #0x1
    bl func_ov002_021aff4c
.L_54:
    ldr r0, [r4, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cdc78
