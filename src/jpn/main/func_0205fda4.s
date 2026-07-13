; func_0205fda4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021010f0
        .extern func_02057cb8
        .extern func_0205c1e4
        .extern func_0205c2cc
        .extern func_020a9698
        .global func_0205fda4
        .arm
func_0205fda4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    ldr ip, [sp, #0x30]
    mov r5, r2
    mov r6, r0
    cmp ip, #0x0
    ldreq r0, _LIT0
    mov lr, r1
    mov r4, r3
    streq r0, [sp, #0x30]
    mov r0, r6
    mov r1, r5
    mov r3, lr
    mov r2, #0xc9
    bl func_0205c2cc
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    add r0, sp, #0x0
    mov r3, r4
    mov r2, #0x1
    bl func_020a9698
    add r2, sp, #0x0
    mov r0, r6
    mov r1, r5
    bl func_02057cb8
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, [sp, #0x30]
    mov r0, r6
    mov r1, r5
    mvn r3, #0x0
    bl func_0205c1e4
    cmp r0, #0x0
    moveq r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021010f0
_LIT1: .word data_021010f0+0x4
