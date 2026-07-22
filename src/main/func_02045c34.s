; func_02045c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045c7c
        .extern func_020aaddc
        .extern Strchr
        .global func_02045c34
        .arm
func_02045c34:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r7, r0
    mov r6, r1
    mov r4, r3
    mov r0, r5
    mov r1, #0x0
    bl Strchr
    mov r2, r0
    mov r0, r7
    mov r1, r6
    mov r3, r4
    bl func_02045c7c
    mov r0, r5
    bl func_020aaddc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
