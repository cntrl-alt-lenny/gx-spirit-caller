; SNDi_SetTrackParam — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094ba0
        .global SNDi_SetTrackParam
        .global .L_02094c24
        .global .L_02094c28
        .global .L_02094c2c
        .global .L_02094c30
        .global .L_02094c34
        .global .L_02094c38
        .global .L_02094c3c
        .global .L_02094c40
        .global .L_02094c44
        .global .L_02094c48
        .global .L_02094c4c
        .global .L_02094c50
        .global .L_02094c54
        .arm
SNDi_SetTrackParam:
.L_02094c24:
    stmfd sp!, {lr}
.L_02094c28:
    sub sp, sp, #0x4
.L_02094c2c:
    ldr ip, [sp, #0x8]
.L_02094c30:
    mov lr, r2
.L_02094c34:
    str r3, [sp]
.L_02094c38:
    mov r2, r1
.L_02094c3c:
    orr r1, r0, ip, lsl #0x18
.L_02094c40:
    mov r3, lr
.L_02094c44:
    mov r0, #0x7
.L_02094c48:
    bl func_02094ba0
.L_02094c4c:
    add sp, sp, #0x4
.L_02094c50:
    ldmfd sp!, {lr}
.L_02094c54:
    bx lr
