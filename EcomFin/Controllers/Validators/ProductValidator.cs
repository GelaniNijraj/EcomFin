using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers.Validators {
    public class ProductValidator: AbstractValidator<Product> {
        public ProductValidator() {
            RuleFor(p => p.Name).NotEmpty();
            RuleFor(p => p.Description).NotEmpty();
            RuleFor(p => p.Price).NotEmpty();
            RuleFor(p => p.Quantity).NotEmpty();
        }
    }
}