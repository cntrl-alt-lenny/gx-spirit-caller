; func_0206c7d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bde0
        .extern func_0206bf20
        .extern func_0206c74c
        .global func_0206c7d8
        .arm
func_0206c7d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsb r2, [r4, #0x72]
    ldr r0, _LIT0
    mov r1, r4
    bl func_0206bf20
    movs r1, r0
    mvneq r0, #0x20
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh r2, [r4, #0x74]
    mov r0, r4
    strh r2, [r1, #0x10]
    ldrh r2, [r4, #0x76]
    strh r2, [r1, #0x12]
    ldr r2, [r4, #0x78]
    str r2, [r1, #0x14]
    ldrsh r2, [r4, #0x70]
    orr r2, r2, #0x2
    strh r2, [r4, #0x70]
    bl func_0206bde0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206c74c
