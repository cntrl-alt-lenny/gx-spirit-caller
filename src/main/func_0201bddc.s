; func_0201bddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020186c8
        .extern func_02018a2c
        .extern func_0201b7e0
        .extern func_0201b82c
        .extern func_0201bbc8
        .extern func_0201bd30
        .global func_0201bddc
        .arm
func_0201bddc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GetSystemWork
    bl func_02018a2c
    mov r0, r4
    bl func_0201b7e0
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
    bl func_020186c8
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0201b82c
    mov r5, r0
    mov r0, r4
    bl func_0201bbc8
    orr r5, r5, r0
    mov r0, r4
    bl func_0201bd30
    orrs r0, r5, r0
    ldreq r0, [r4, #0x18]
    orreq r0, r0, #0x1000000
    streq r0, [r4, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
