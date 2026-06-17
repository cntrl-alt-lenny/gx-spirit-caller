; func_ov002_02257a44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_02257464
        .global func_ov002_02257a44
        .arm
func_ov002_02257a44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mov r4, #0x0
    bl func_ov002_02257464
    movs r5, r0
    ldr r0, _LIT0
    mov r6, r4
    str r6, [r0, #0x5c0]
    ldrne r0, [r5, #0x8]
    cmpne r0, #0x0
    beq .L_224
    mov r8, #0x5
.L_1ec:
    mov r9, r8
.L_1f0:
    ldr r3, [r5, #0x8]
    mov r0, r7
    mov r1, r6
    mov r2, r9
    blx r3
    cmp r0, #0x0
    add r9, r9, #0x1
    addne r4, r4, #0x1
    cmp r9, #0xa
    ble .L_1f0
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_1ec
.L_224:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
