; func_0201bd9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018694
        .extern func_020189f8
        .extern func_0201b7a0
        .extern func_0201b7ec
        .extern func_0201bb88
        .extern func_0201bcf0
        .global func_0201bd9c
        .arm
func_0201bd9c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GetSystemWork
    bl func_020189f8
    mov r0, r4
    bl func_0201b7a0
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x8]
    str r0, [r4]
    ldr r1, [r4, #0x1c]
    mov r0, r4
    bic r1, r1, #0xff00
    orr r2, r1, #0xff00
    bic r1, r2, #0x1f0000
    orr r1, r1, #0x1f0000
    str r1, [r4, #0x1c]
    bl func_02018694
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0201b7ec
    mov r5, r0
    mov r0, r4
    bl func_0201bb88
    orr r5, r5, r0
    mov r0, r4
    bl func_0201bcf0
    orrs r0, r5, r0
    ldreq r0, [r4, #0x18]
    orreq r0, r0, #0x1000000
    streq r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
