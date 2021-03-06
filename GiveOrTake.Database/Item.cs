﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GiveOrTake.Database
{
	public class Item
	{
		public Item() { Transaction = new HashSet<Transaction>(); }
		public Guid ItemId { get; set; }

		[MaxLength(64)]
		[Required]
		public string Name { get; set; }

		[MaxLength(255)]
		[Required]

		public string UserId { get; set; }
		public User User { get; set; }

		public HashSet<Transaction> Transaction { get; set; }
	}
}
