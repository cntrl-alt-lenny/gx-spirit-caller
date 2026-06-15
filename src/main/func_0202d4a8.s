; func_0202d4a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be9e8
        .extern data_020c6d28
        .extern data_0219ad48
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_0202d4a8
        .arm
func_0202d4a8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    ldr r2, _LIT0
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    ldr r1, _LIT1
    mov r4, r0
    add r0, sp, #0x28
    bl func_02091554
    add r0, sp, #0x0
    bl func_0201d47c
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    ldr r0, _LIT2
    mov r1, r4, lsl #0x2
    ldr r0, [r0, #0x6c]
    ldrh ip, [sp, #0x14]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    add r0, r1, #0xf
    add r1, r0, #0x100
    add r0, r4, #0x6
    mov r2, r1, lsl #0x5
    mov r1, r0, lsl #0x5
    mvn r0, #0x0
    str r0, [sp, #0x8]
    bic r4, ip, #0xf
    and r0, r3, #0xf
    orr r3, r4, r0
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_020be9e8
_LIT1: .word data_020c6d28
_LIT2: .word data_0219ad48
