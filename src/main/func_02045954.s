; func_02045954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dad0
        .extern func_020458d8
        .extern func_02077b4c
        .extern func_020945f4
        .global func_02045954
        .arm
func_02045954:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2]
    mov r5, r1
    mov r4, r3
    cmp r2, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, #0xc
    bl func_020945f4
    strh r5, [r6, #0x8]
    mov r0, #0x1
    strh r0, [r6, #0xa]
    strh r0, [r6, #0x4]
    mov r0, #0x0
    ldr r1, _LIT0
    strh r0, [r6, #0x6]
    str r6, [r1]
    bl func_020458d8
    mov r0, r4
    bl func_02077b4c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dad0
