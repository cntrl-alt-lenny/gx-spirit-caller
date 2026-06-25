; func_0201f79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_0201f820
        .extern func_02093b08
        .global func_0201f79c
        .arm
func_0201f79c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3, #0x30]
    mov r4, r1
    mov r6, r2
    cmp r0, #0x1
    beq .L_28
    bl func_02093b08
    movs r0, #0x0
.L_28:
    mov r0, #0x2
    bl func_0201f0e4
    ldr r0, _LIT0
    mov r1, #0x0
    str r5, [r0, #0x28]
    strh r6, [r0, #0x2]
    strh r1, [r0, #0x84]
    strh r1, [r0]
    ldrh r1, [r4, #0x4]
    strh r1, [r0, #0x8c]
    ldrh r1, [r4, #0x2]
    strh r1, [r0, #0x8a]
    ldrh r1, [r4]
    strh r1, [r0, #0x88]
    bl func_0201f820
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, #0x9
    bl func_0201f0e4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02191e60
