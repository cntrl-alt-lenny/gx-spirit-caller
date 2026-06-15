; func_02051384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc8c
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204ab88
        .extern func_0204f310
        .extern func_0204f820
        .extern func_02051618
        .global func_02051384
        .arm
func_02051384:
    stmdb sp!, {r4, lr}
    mov lr, r1
    mov ip, r2
    mov r4, r3
    mov r1, r0
    mov r2, lr
    mov r3, ip
    mov r0, #0x2
    bl func_0204f310
    bl func_020498f0
    str r4, [r0, #0x46c]
    bl func_020498f0
    ldr r1, [sp, #0x8]
    str r1, [r0, #0x470]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x200]
    str r0, [r4, #0xf4]
    bl func_020498f0
    mov r1, #0x1
    str r1, [r0, #0x2f0]
    bl func_020498f0
    mov r2, #0x0
    strb r2, [r0, #0xe]
    ldr r1, _LIT0
    mov r0, #0xa
    strb r2, [r1, #0x1]
    bl func_020498dc
    bl func_0204f820
    bl func_0204ab88
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_020498f0
    ldr r0, [r0, #0x200]
    bl func_02051618
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc8c
