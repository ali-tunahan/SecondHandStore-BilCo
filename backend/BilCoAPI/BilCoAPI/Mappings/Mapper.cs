using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using BilCoAPI.Core.Models.DTOs;
using BilCoAPI.Core.Models.Entities;
using BilCoAPI.Core.Models.Entities.Identity;

namespace BilCoAPI.Mappings
{
    public class Mapper:Profile
    {
        public Mapper()
        {
            //Demo
            CreateMap<Demo, DemoDTO>().ReverseMap();
            CreateMap<Demo, CreateDemoDTO>().ReverseMap();

            //User
            CreateMap<User, UserDTO>().ReverseMap();
            CreateMap<User, CreateUserDTO>().ReverseMap();
            CreateMap<UpdateUserDTO, User>().ReverseMap();

            //Comment
            CreateMap<Comment, CommentDTO>().ReverseMap();
            CreateMap<Comment, CreateCommentDTO>().ReverseMap();

            //Post
            CreateMap<Post, PostDTO>().ForMember(dest => dest.PostImage, opt => opt.MapFrom(src => src.PostImages.FirstOrDefault()));
            CreateMap<PostDTO, Post>().ForMember(dest => dest.PostImages, opt => opt.MapFrom(src => new List<PostImage> {src.PostImage})).ForMember(dest => dest.UserId, opt => opt.Ignore());
            CreateMap<Post, CreatePostDTO>().ReverseMap();
            CreateMap<Post, PostDetailsDTO>();
            CreateMap<UpdatePostDTO, Post>().ReverseMap();

            //PostImage
            CreateMap<PostImage, CreatePostImageDTO>().ReverseMap();
            CreateMap<UserImage, CreateUserImageDTO>().ReverseMap();

        }
    }
}
