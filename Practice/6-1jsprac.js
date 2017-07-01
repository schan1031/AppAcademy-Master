Function.prototype.myBind (context) {
  return () => this.apply(context);
}
