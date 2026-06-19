; func_ov002_022ae2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca4e4
        .extern data_ov002_022cc764
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_ov002_022ae2e0
        .arm
func_ov002_022ae2e0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    cmp r2, #0xa
    mov r5, r1
    addgt sp, sp, #0x48
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    add r0, sp, #0x28
    ldr r2, [r1, r2, lsl #0x2]
    ldr r1, _LIT1
    bl func_02091554
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r1, [sp, #0x14]
    mov r0, r5, lsl #0xb
    add r0, r0, #0x80
    add r2, r0, #0x4000
    bic r1, r1, #0xf
    orr r3, r1, #0x9
    mvn r1, #0x0
    add r0, sp, #0x0
    str r4, [sp]
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ca4e4
_LIT1: .word data_ov002_022cc764
