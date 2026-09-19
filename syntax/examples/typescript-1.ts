@ns.component
interface View { readonly size: number; }
const x = {size: 10} satisfies View;
