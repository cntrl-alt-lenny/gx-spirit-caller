; func_0205172c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbac
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204988c
        .extern func_0204b2fc
        .extern func_0204f34c
        .extern func_02094500
        .global func_0205172c
        .arm
func_0205172c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0204988c
    bl func_0204987c
    str r6, [r0]
    bl func_0204987c
    str r5, [r0, #0x4]
    bl func_0204987c
    str r4, [r0, #0x8]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x10]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c]
    bl func_0204987c
    mov r1, #0x0
    strh r1, [r0, #0x1a]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe4]
    mov r0, r1
    bl func_02049868
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xf]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a7]
    bl func_0204987c
    mov r1, #0x0
    add r0, r0, #0x100
    strh r1, [r0, #0xae]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1d4]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1f8]
    bl func_0204987c
    ldr r1, [sp, #0x10]
    str r1, [r0, #0x2ec]
    bl func_0204987c
    ldr r1, [sp, #0x14]
    str r1, [r0, #0x2f0]
    bl func_0204987c
    ldr r1, [sp, #0x18]
    str r1, [r0, #0x2f4]
    bl func_0204987c
    ldr r1, [sp, #0x1c]
    str r1, [r0, #0x2f8]
    bl func_0204987c
    add r0, r0, #0x2fc
    mov r1, #0x0
    mov r2, #0x40
    bl func_02094500
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x33c]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x45c]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x460]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x46c]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x470]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x474]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x478]
    bl func_0204b2fc
    ldr r1, _LIT0
    mov r0, #0x0
    strb r0, [r1]
    strb r0, [r1, #0x1]
    strh r0, [r1, #0x2]
    bl func_0204f34c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dbac
