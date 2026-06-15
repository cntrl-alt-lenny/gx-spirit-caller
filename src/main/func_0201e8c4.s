; func_0201e8c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005b38
        .extern func_0201e818
        .global func_0201e8c4
        .arm
func_0201e8c4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, [sp, #0x1c]
    mov r7, r2
    mov r6, r3
    bl func_02005b38
    mov r4, r0
    ldr r2, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    mov r3, r5
    bl func_0201e818
    ldr r1, [r5]
    mov r0, r4
    mov r1, r1, asr #0x4
    strh r1, [r4, #0x6]
    ldr r1, [r5, #0x4]
    mov r1, r1, asr #0x4
    strh r1, [r4, #0xe]
    ldr r1, [r5, #0x8]
    mov r1, r1, asr #0x4
    strh r1, [r4, #0x16]
    ldr r1, [r5, #0xc]
    mov r1, r1, asr #0x4
    strh r1, [r4, #0x1e]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
