import { Author } from './author.model';

export interface Article {
  slug: string;
  title: string;
  description: string;
  body: string;
  tagList: string[];
  createdAt: string;
  updatedAt: string;
  favorited: boolean;
  favoritesCount: number;
  disliked: boolean;
  dislikedCount: number;
  author: Author;
}
