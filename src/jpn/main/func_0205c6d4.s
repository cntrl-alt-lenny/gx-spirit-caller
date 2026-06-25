; func_0205c6d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045398
        .extern func_02054144
        .extern func_02054b28
        .extern func_0205c764
        .extern func_020a72e0
        .global func_0205c6d4
        .arm
func_0205c6d4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, [r0]
    mov r0, #0x40
    mov r7, r1
    mov r6, r2
    bl func_02045398
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r2, #0x40
    bl func_020a72e0
    mov r0, #0x64
    str r0, [r4]
    str r6, [r4, #0x4]
    mvn r0, #0x0
    str r0, [r4, #0x8]
    mov r0, #0x0
    str r7, [r4, #0xc]
    bl func_02054b28
    add r0, r0, #0x12c
    str r0, [r4, #0x10]
    ldr r3, [r5, #0x434]
    ldr r2, _LIT0
    mov r0, #0x18
    mov r1, #0x0
    str r3, [r4, #0x3c]
    bl func_02054144
    str r0, [r4, #0x38]
    mov r0, r4
    str r4, [r5, #0x434]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_0205c764
