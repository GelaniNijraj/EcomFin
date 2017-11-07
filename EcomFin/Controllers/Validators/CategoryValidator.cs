using FluentValidation;
using FluentValidation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers.Validators {
    public class CategoryValidator: AbstractValidator<Category> {
        public CategoryValidator() {
            RuleFor(r => r.Name).NotEmpty();
        }
    }
}