; func_ov002_021b306c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern func_ov002_021b2ddc
        .extern func_ov002_021c19f0
        .extern func_ov002_021c1c6c
        .global func_ov002_021b306c
        .arm
func_ov002_021b306c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r7, r1
    mov r6, r2
    bl func_ov002_021c19f0
    mov r5, r0
    mov r0, r4
    mov r1, r7
    bl func_ov002_021c1c6c
    mov r1, #0x14
    mul r3, r7, r1
    str r5, [sp]
    str r0, [sp, #0x4]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r2, r6
    mov r0, r4
    and r4, r4, #0x1
    mla r1, r4, r1, ip
    ldrh r1, [r3, r1]
    mov r3, #0x1
    bl func_ov002_021b2ddc
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
