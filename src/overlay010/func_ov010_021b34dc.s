; func_ov010_021b34dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8a60
        .extern data_ov010_021b8cd0
        .extern data_ov010_021b8ce4
        .extern func_02006e1c
        .extern func_0201edac
        .extern func_0201ede4
        .extern func_0207f510
        .extern func_0207f610
        .global func_ov010_021b34dc
        .arm
func_ov010_021b34dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r3, _LIT0
    mov r6, r1
    ldr r1, [r3]
    mov r7, r0
    add r0, sp, #0x4
    mov r5, r2
    bl func_0201edac
    mov r4, r0
    ldr r0, [sp, #0x4]
    ldr r3, _LIT1
    mov r1, r6
    mov r2, r7
    bl func_0207f610
    mov r0, r4
    bl func_02006e1c
    ldr r1, _LIT0
    add r0, sp, #0x0
    ldr r1, [r1, #0x4]
    bl func_0201ede4
    mov r4, r0
    ldr r0, [sp]
    ldr r3, _LIT2
    mov r1, r5
    mov r2, r7
    bl func_0207f510
    mov r0, r4
    bl func_02006e1c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov010_021b8a60
_LIT1: .word data_ov010_021b8ce4
_LIT2: .word data_ov010_021b8cd0
